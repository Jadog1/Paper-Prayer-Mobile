

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaperMode extends ConsumerWidget {
  const PaperMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const OpenPaper();
  }
}


class OpenPaper extends ConsumerStatefulWidget {
  const OpenPaper({super.key});

  @override
  ConsumerState<OpenPaper> createState() => _OpenPaperState();
}

class _OpenPaperState extends ConsumerState<OpenPaper>{
  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  final List<String> _suggestions = ['John Doe', 'Jane Smith', 'Alex Johnson'];
  String _searchQuery = '';
  int _triggerPosition = -1;
  String _selectedUser = '';

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    String text = _controller.text;
    int cursorPos = _controller.selection.baseOffset;

    if (text.contains('\n\n')) {
      _controller.clear();
      return;
    }

    // Detect "@" and store the position
    if (cursorPos <= 0) {
      _hideSuggestions();
      return;
    }
    int lastTrigger = text.lastIndexOf('@', cursorPos - 1);
    if (lastTrigger != -1) {
      _triggerPosition = lastTrigger;
      _searchQuery = text.substring(lastTrigger + 1, cursorPos);
      _showSuggestions();
    } else {
      _hideSuggestions();
    }
    if (text.lastIndexOf("@") < cursorPos) {
      setState(() => _searchQuery = text.substring(text.lastIndexOf("@") + 1, cursorPos));
    }
  }

  void _showSuggestions() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideSuggestions() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    Offset caretOffset = _getCaretPosition();
    
    return OverlayEntry(
      builder: (context) => Positioned(
        left: caretOffset.dx,
        top: caretOffset.dy + 60, // Position below the caret
        width: 200,
        child: Material(
          elevation: 4.0,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: _suggestions
                .where((s) => s.toLowerCase().contains(_searchQuery.toLowerCase()))
                .map((s) => ListTile(
                      title: Text(s),
                      onTap: () => _selectSuggestion(s),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Offset _getCaretPosition() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: _controller.text, style: const TextStyle(fontSize: 16.0)),
      textDirection: TextDirection.ltr,
    )..layout();
    
    final TextPosition position = TextPosition(offset: _controller.selection.baseOffset);
    final Offset caretOffset = textPainter.getOffsetForCaret(position, Rect.zero);
    
    return caretOffset;
  }

  void _selectSuggestion(String suggestion) {
    String text = _controller.text;
    _controller.text = text.replaceRange(_triggerPosition, _controller.selection.baseOffset, '');
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    setState(() => _selectedUser = suggestion);

    _hideSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Text(
              _selectedUser.isEmpty ? 'No user selected' : _selectedUser,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _controller,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: 'Use @ to set the current user',
                constraints: BoxConstraints(maxHeight: 200.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
