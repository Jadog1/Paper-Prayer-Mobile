import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  bool _tipsExpanded = true;

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
        // Collapsible Instructions
        InkWell(
          onTap: () {
            setState(() {
              _tipsExpanded = !_tipsExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Edit Mode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                    Icon(
                      _tipsExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.blue.shade700,
                    ),
                  ],
                ),
                if (_tipsExpanded) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Enter one prayer request per line. You can paste content from other sources.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tip: When you paste content, it will automatically switch to Read Mode for review.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

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
                hintText: 'Enter prayer requests here, one per line...',
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
