import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/providers/batch_paper_mode_provider.dart';

/// Edit mode view with a large text area for entering prayer requests
class EditModeView extends ConsumerStatefulWidget {
  const EditModeView({
    super.key,
    required this.config,
  });

  final BatchPaperModeConfig config;

  @override
  ConsumerState<EditModeView> createState() => _EditModeViewState();
}

class _EditModeViewState extends ConsumerState<EditModeView> {
  late TextEditingController _textController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final state = ref.read(batchPaperModeNotifierProvider(widget.config));
    _textController = TextEditingController(text: state.rawContent);
    
    // Listen for paste events
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final notifier = ref.read(batchPaperModeNotifierProvider(widget.config).notifier);
    notifier.updateRawContent(_textController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text area
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                hintText: 'Enter prayer requests here, one per line...\n\nTip: Click the Help button above for guidance on formatting.',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16),
              ),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
