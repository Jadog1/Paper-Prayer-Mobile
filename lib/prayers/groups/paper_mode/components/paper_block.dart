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
    
    final useViewableRequest = widget.config.readOnly ||
        (state.aiMode &&
            widget.allowsAIMode &&
            !_editFocusNode.hasFocus &&
            !state.prayerIdsInOverrideEditMode.contains(widget.prayerRequest.id));
    
    final requiresUserSelection =
        !widget.config.readOnly && state.selectedUser == null && widget.newRequest && widget.currentGroup != null;

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
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _editFocusNode.requestFocus();
          });
        },
        focusNode: _userSelectionFocusNode,
      );
    }

    if (state.hiddenPrayerRequests.containsKey(widget.prayerRequest.id)) {
      return const SizedBox.shrink();
    }

    if (useViewableRequest) {
      return ViewableRequest(
        request: widget.prayerRequest,
        focusOnEdit: widget.config.readOnly ? null : focusOnEdit,
      );
    }

    return EditableRequest(
      prayerRequest: widget.prayerRequest,
      focusNode: _editFocusNode,
      newRequest: widget.newRequest,
      controller: _controller,
    );
  }
}
