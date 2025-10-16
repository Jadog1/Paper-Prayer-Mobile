import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/breaks.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_block.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';

/// A widget that manages new requests created by the user at the bottom of the page.
/// 
/// It handles the state of who the current request is for and displays all
/// the newly created requests with proper username breaks.
class NewRequestsManager extends ConsumerStatefulWidget {
  const NewRequestsManager({
    super.key,
    required this.currentGroup,
    required this.previousRequest,
    required this.config,
  });

  final GroupWithMembers currentGroup;
  final PrayerRequest? previousRequest;
  final PaperModeConfig config;

  @override
  ConsumerState<NewRequestsManager> createState() => _NewRequestsManagerState();
}

class _NewRequestsManagerState extends ConsumerState<NewRequestsManager> {
  final FocusNode _focusNode = FocusNode();
  final FocusNode _userSelectionFocusNode = FocusNode();
  final TextEditingController _userSelectionController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _userSelectionFocusNode.dispose();
    _userSelectionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _userSelectionFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = ref.watch(paperModeStateProvider);
    final state = stateNotifier.state;
    final newRequests = state.newRequests;
    
    return Column(
      children: [
        for (var i = 0; i < newRequests.length; i++) ...[
          if (((i == 0 &&
                      (widget.previousRequest == null ||
                          newRequests[i].user.id !=
                              widget.previousRequest!.user.id)) ||
                  (i > 0 &&
                      newRequests[i].user.id != newRequests[i - 1].user.id)) &&
              state.selectedUser != null)
            usernameBreak(context, newRequests[i]),
          PaperBlock(
            prayerRequest: newRequests[i],
            currentGroup: widget.currentGroup,
            config: widget.config,
            newRequest: true,
            allowsAIMode: newRequests[i].features != null,
          ),
        ],
      ],
    );
  }
}
