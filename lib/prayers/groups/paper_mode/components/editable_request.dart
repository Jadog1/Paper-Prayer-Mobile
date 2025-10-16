import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_margin_space.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';

/// Save state enum for visual feedback
enum SaveState { saving, saved, failed, editing, noAction }

/// An editable text field for a prayer request
class EditableRequest extends ConsumerStatefulWidget {
  const EditableRequest({
    super.key,
    required this.prayerRequest,
    required this.focusNode,
    required this.controller,
    this.newRequest = false,
    this.isExportMode = false,
  });

  final PrayerRequest prayerRequest;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool newRequest;
  final bool isExportMode;

  @override
  ConsumerState<EditableRequest> createState() => _EditableRequestState();
}

class _EditableRequestState extends ConsumerState<EditableRequest> {
  Timer? _debounce;
  bool _isFocused = false;
  bool _isSaving = false;
  SaveState _saveState = SaveState.noAction;

  @override
  void dispose() {
    _debounce?.cancel();
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onChanged(String text) {
    setState(() => _saveState = SaveState.saving);

    _debounce?.cancel();
    if (text.startsWith("@") || (text.isEmpty && widget.prayerRequest.id == 0)) {
      setState(() => _saveState = SaveState.noAction);
      return;
    }
    _debounce = Timer(const Duration(seconds: 1), () async {
      _isSaving = true;
      try {
        var newRequest = widget.prayerRequest.copyWith(description: text);
        if (widget.prayerRequest.id == 0) {
          newRequest = await saveNewRequest(newRequest);
          widget.prayerRequest.id = newRequest.id;
        } else {
          newRequest = await updateRequest(newRequest);
        }
        widget.prayerRequest.description = newRequest.description;
        setState(() => _saveState = SaveState.saved);
      } catch (_) {
        setState(() => _saveState = SaveState.failed);
      }
      _isSaving = false;
    });
  }

  void _handleDelete() async {
    if (widget.prayerRequest.id == 0) {
      return;
    }
    _debounce?.cancel();
    // Wait until _isSaving is false before deleting
    while (_isSaving) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    var state = ref.read(paperModeStateProvider);
    setState(() => _saveState = SaveState.saving);
    try {
      await removeRequest(widget.prayerRequest);
      state.hidePrayerRequest(widget.prayerRequest.id);
    } catch (_) {
      setState(() => _saveState = SaveState.failed);
    }
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode.hasFocus;
      if (_saveState == SaveState.noAction && _isFocused) {
        _saveState = SaveState.editing;
      } else if (_saveState == SaveState.editing && !_isFocused) {
        _saveState = SaveState.noAction;
        if (widget.prayerRequest.id != 0) {
          try {
            clearDebounceTimeout(widget.prayerRequest.id);
          } catch (e) {
            log("Error clearing debounce timeout: $e");
          }
          ref.read(paperModeStateProvider).setEditModeOverride(
              widget.prayerRequest.id, false);
        }
      }
    });
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.enter &&
        widget.newRequest) {
      var state = ref.read(paperModeStateProvider);
      var user = state.state.selectedUser;
      if (user == null) {
        return KeyEventResult.ignored;
      }
      if (widget.controller.text.isEmpty) {
        return KeyEventResult.handled;
      }
      try {
        clearDebounceTimeout(widget.prayerRequest.id);
      } catch (e) {
        log("Error clearing debounce timeout: $e");
      }
      state.addDefaultPrayerRequest(user);
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        widget.controller.text.isEmpty) {
      _debounce?.cancel();
      _handleDelete();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    switch (_saveState) {
      case SaveState.saving:
        icon = const Icon(Icons.sync, size: 16);
        break;
      case SaveState.failed:
        icon = const Icon(Icons.error, size: 16, color: Colors.red);
        break;
      case SaveState.saved:
        icon = const Icon(Icons.check, size: 16, color: Colors.green);
        break;
      case SaveState.editing:
        icon = const Icon(Icons.edit, size: 16, color: Colors.grey);
        break;
      case SaveState.noAction:
        icon = null;
        break;
    }

    return Focus(
      onKeyEvent: _handleKeyEvent,
      child: PaperMarginSpace(
        icon: icon,
        paperLine: Expanded(
          child: Row(
            children: [
              const Text("• "),
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: _onChanged,
                  
                  maxLines: null,
                  enabled: !widget.isExportMode,
                  decoration: InputDecoration(
                    hintText: "Enter prayer request or @ to select user",
                    hintStyle: const TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                      border: _isFocused
                          ? const UnderlineInputBorder()
                          : InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
