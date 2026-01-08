import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/editable_request.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/user_selection.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/viewable_request.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/export_provider.dart';

/// A widget that represents a block of text in the paper mode view.
///
/// This can be a ViewableRequest, EditableRequest, or UserSelection widget.
/// It manages state between swapping modes and relies on PaperModeState
/// for determining whether view/edit mode is active.
class PaperBlock extends ConsumerStatefulWidget {
  const PaperBlock({
    super.key,
    required this.prayerRequest,
    this.currentGroup,
    required this.config,
    this.allowsAIMode = false,
    this.newRequest = false,
  });

  final PrayerRequest prayerRequest;
  final GroupWithMembers? currentGroup;
  final PaperModeConfig config;
  final bool allowsAIMode;
  final bool newRequest;

  @override
  ConsumerState<PaperBlock> createState() => _PaperBlockState();
}

class _PaperBlockState extends ConsumerState<PaperBlock> {
  final FocusNode _editFocusNode = FocusNode();
  final FocusNode _userSelectionFocusNode = FocusNode();
  late TextEditingController _controller;
  bool _changingUser = false;

  void onChange(String text) {
    var changingUser = text.startsWith("@");
    if (changingUser != _changingUser) {
      setState(() {
        _changingUser = changingUser;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (changingUser) {
          _userSelectionFocusNode.requestFocus();
        } else {
          _editFocusNode.requestFocus();
        }
      });
    }
  }

  void focusOnEdit() {
    if (!_editFocusNode.hasFocus) {
      _editFocusNode.requestFocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.prayerRequest.description,
    );
    _controller.addListener(() {
      onChange(_controller.text);
    });
    if (widget.prayerRequest.id == 0 && !widget.config.readOnly) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _editFocusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _editFocusNode.dispose();
    _userSelectionFocusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(paperModeStateProvider);
    final state = stateNotifier.state;
    final exportNotifier = ref.watch(exportStateProvider);
    final exportState = exportNotifier.state;

    // New requests start in edit mode (id==0). Once saved (id!=0), we allow
    // switching into ViewableRequest in AI mode even if features aren't ready yet.
    final allowsAIModeForThisBlock = widget.allowsAIMode ||
        (widget.newRequest && widget.prayerRequest.id != 0);

    final useViewableRequest = widget.config.readOnly ||
        (state.aiMode &&
            allowsAIModeForThisBlock &&
            !_editFocusNode.hasFocus &&
            !state.prayerIdsInOverrideEditMode
                .contains(widget.prayerRequest.id));

    final requiresUserSelection = !widget.config.readOnly &&
        state.selectedUser == null &&
        widget.newRequest &&
        widget.currentGroup != null;

    if (requiresUserSelection || _changingUser) {
      return UserSelection(
        currentGroup: widget.currentGroup!,
        controller: _controller,
        config: widget.config,
        changeCallback: (ContactAndGroupPair contactAndGroupPair) {
          stateNotifier.setContact(contactAndGroupPair);
          setState(() {
            widget.prayerRequest.user = contactAndGroupPair.contact;
            widget.prayerRequest.group = contactAndGroupPair.groupPair;
          });
        },
        focusNode: _userSelectionFocusNode,
      );
    }

    if (state.hiddenPrayerRequests.containsKey(widget.prayerRequest.id)) {
      return const SizedBox.shrink();
    }

    // Wrap the content with selection highlighting if in export mode
    Widget content;
    if (useViewableRequest) {
      content = ViewableRequest(
        request: widget.prayerRequest,
        focusOnEdit: widget.config.readOnly ? null : focusOnEdit,
        isExportMode: exportState.isExportMode,
        groupId: widget.config.effectiveGroupId,
      );
    } else {
      content = EditableRequest(
        prayerRequest: widget.prayerRequest,
        focusNode: _editFocusNode,
        newRequest: widget.newRequest,
        controller: _controller,
        isExportMode: exportState.isExportMode,
      );
    }

    // Add selection wrapper if in export mode
    if (exportState.isExportMode) {
      final isSelected = exportState.isSelected(widget.prayerRequest.id);
      return GestureDetector(
        onTap: () {
          exportNotifier.toggleRequest(widget.prayerRequest.id);
        },
        child: Container(
          // margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
          // padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withValues(alpha: 0.3)
                : null,
            border: isSelected
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              content,
              if (isSelected)
                Positioned(
                  right: 8,
                  child: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return content;
  }
}
