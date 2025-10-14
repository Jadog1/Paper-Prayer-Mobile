import 'package:flutter/material.dart';

/// Dialog for adding an update to a collection
class AddCollectionUpdateDialog extends StatefulWidget {
  final String collectionTitle;

  const AddCollectionUpdateDialog({
    super.key,
    required this.collectionTitle,
  });

  @override
  State<AddCollectionUpdateDialog> createState() => _AddCollectionUpdateDialogState();
}

class _AddCollectionUpdateDialogState extends State<AddCollectionUpdateDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    // Listen to text changes to rebuild the widget
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Update to ${widget.collectionTitle}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Share a new update or answer to this prayer:',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter your update here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              minLines: 3,
              autofocus: true,
              enabled: !_isSaving,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(null),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSaving || _controller.text.trim().isEmpty
              ? null
              : () {
                  final updateText = _controller.text.trim();
                  if (updateText.isNotEmpty) {
                    setState(() => _isSaving = true);
                    Navigator.of(context).pop(updateText);
                  }
                },
          child: _isSaving
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Save'),
        ),
      ],
    );
  }
}
