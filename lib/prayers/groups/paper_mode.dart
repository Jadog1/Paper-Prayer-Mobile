

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode_view_model.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/notebook_repo.dart';
import 'package:prayer_ml/prayers/prayers_shared/prayers_shared_widgets.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:prayer_ml/shared/widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class PaperMode extends ConsumerWidget {
  const PaperMode({super.key, required this.groupContacts});

  final GroupContacts groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        children: [
          AppBar(
            title: const Text("Paper Mode"),
          ),
          // ConstrainedBox(
          //   constraints: const BoxConstraints(maxHeight: 200),
          //   child: const QueuedPrayerRequests(),
          // ),
          // const SelectedUserTitle(),
          // OpenPaper(users: groupContacts.members),
          Expanded(child: Paper(group: groupContacts.group)),
          // const Expanded(
          //   child: RecommendedPrayerRequestsLoader(),
          // ),
        ],
      ),
    );
  }
} 

class Paper extends ConsumerStatefulWidget {
  const Paper({super.key, required this.group});
  final Group group;

  @override
  ConsumerState<Paper> createState() => _PaperState();
}
class _PaperState extends ConsumerState<Paper> {

  Widget usernameBreak(PrayerRequest prayerRequest) {
    return Text(
      prayerRequest.user.name, 
      textAlign: TextAlign.left,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    );
  }

  Widget dateBreak(PrayerRequest prayerRequest) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Divider(),
        Text(formatTimestamp(prayerRequest.createdAt),
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = paginatedPrayerRequestsNotifierProvider(10, widget.group.id);
    return PagingHelperView(
        provider: provider,
        futureRefreshable: provider.future,
        notifierRefreshable: provider.notifier,
        contentBuilder: (data, widgetCount, endItemView) => ListView.builder(
          itemCount: widgetCount,
          reverse: true,
          itemBuilder: (context, index) {
            // if the index is last, then
            // return the end item view.
            if (index == widgetCount - 1) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [endItemView, dateBreak(data.items[index-1]), usernameBreak(data.items[index-1])]);
            }
            List<Widget> widgets = [];
            widgets.add(EditableRequest(prayerRequest: data.items[index]));

            if (index > 0 && daysBetween(DateTime.parse(data.items[index].createdAt), DateTime.parse(data.items[index-1].createdAt)) > 1) {
              widgets.add(dateBreak(data.items[index-1]));
              widgets.add(usernameBreak(data.items[index-1]));
            } else if (index > 0 && data.items[index].user.id != data.items[index-1].user.id) {
              widgets.add(usernameBreak(data.items[index-1]));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            );
          },
        ),
    );
  }
}

class EditableRequest extends ConsumerWidget {
  const EditableRequest({super.key, this.prayerRequest});

  final PrayerRequest? prayerRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var text = prayerRequest?.description ?? '';
    return Text("• $text",
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
    );
  }
}

class SelectedUserTitle extends ConsumerWidget {
  const SelectedUserTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(paperModeSharedStateProvider);
    return Text(
      state.selectedUser != null ? state.selectedUser!.name : 'No user selected',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      textAlign: TextAlign.center,
    );
  }
}


class OpenPaper extends ConsumerStatefulWidget {
  const OpenPaper({super.key, required this.users});
  final List<Contact> users;

  @override
  ConsumerState<OpenPaper> createState() => _OpenPaperState();
}

class _OpenPaperState extends ConsumerState<OpenPaper>{
  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  String _searchQuery = '';
  int _triggerPosition = -1;
  Contact? _selectedUser;
  late TextField _textField;
  final GlobalKey _textFieldKey = GlobalKey();

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
    var state = ref.read(paperModeSharedStateProvider);

    // TODO: Show error text if _selectedUser is null
    if (text.contains('\n\n') && _selectedUser != null) {
      state.addRequest(AsyncSavedPrayerRequest(request: text.trim(), user: _selectedUser!));
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
        top: caretOffset.dy + 15, // Position below the caret
        width: 200,
        child: Material(
          elevation: 4.0,
          color: Colors.white,
          child: Scrollbar(
            child: SizedBox(
              height: 200,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.users
                    .where((user) => user.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .map((user) => ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.description ?? ''),
                          onTap: () => _selectSuggestion(user),
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Offset _getCaretPosition() {
    TextPainter painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text: _controller.text, style: const TextStyle(fontSize: 16.0)),
    );
    painter.layout();

    TextPosition cursorTextPosition = _controller.selection.base;
    RenderBox box = _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    Rect caretPrototype = Rect.fromLTWH(
        0.0, 0.0, _textField.cursorWidth, _textField.cursorHeight ?? 0);
    Offset caretOffset =
        painter.getOffsetForCaret(cursorTextPosition, caretPrototype);
    caretOffset = Offset(caretOffset.dx, caretOffset.dy + position.dy);
    
    return caretOffset;
  }

  void _selectSuggestion(Contact user) {
    var state = ref.read(paperModeSharedStateProvider);
    String text = _controller.text;
    _controller.text = text.replaceRange(_triggerPosition, _controller.selection.baseOffset, '');
    _controller.selection = TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
    setState(() => _selectedUser = user);
    state.addContact(user);
    state.setContact(user);

    _hideSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    _textField = TextField(
      controller: _controller,
      minLines: 4,
      maxLines: 6,
      key: _textFieldKey,
      decoration: const InputDecoration(
        hintText: 'Use @ to set the current user',
        border: null,
        // constraints: BoxConstraints(maxHeight: 50),
      ),
    );
    return _textField;
  }
}

class QueuedPrayerRequests extends ConsumerWidget {
  const QueuedPrayerRequests({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(paperModeSharedStateProvider);
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.requests.length,
        itemBuilder: (context, index) {
          var prayerRequest = state.requests[index];
          var currentUser = prayerRequest.user;
          Contact? lastUser; 
          if (index > 0) {
            lastUser = state.requests[index - 1].user;
          }
          Widget elem = QueuedPrayerRequest(asyncPrayerRequest: prayerRequest);
          if (lastUser == null || lastUser.id != currentUser.id) {
            elem = Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (lastUser != null) ? const Divider() : const SizedBox.shrink(),
                Text(currentUser.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                elem,
              ],
            );
          }
          return elem;
        },
      ),
    );
  }
}

class QueuedPrayerRequest extends ConsumerWidget {
  const QueuedPrayerRequest({super.key, required this.asyncPrayerRequest});

  final AsyncSavedPrayerRequest asyncPrayerRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      "- ${asyncPrayerRequest.request}", 
      textAlign: TextAlign.left,
      );
  }
}

class RecommendedPrayerRequestsLoader extends ConsumerWidget {
  const RecommendedPrayerRequestsLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(paperModeSharedStateProvider);
    if (state.selectedUser == null) {
      return const Text("No recommended requests");
    }
    var recommendedRequests = ref.watch(fetchRecommendationsProvider(state.selectedUser!.id));
    return switch(recommendedRequests) {
      AsyncData(:final value) => RecommendedPrayerRequestsView(collections: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "PrayerRequestConsumer", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  }
}

class RecommendedPrayerRequestsView extends ConsumerWidget {
  const RecommendedPrayerRequestsView({super.key, required this.collections});

  final List<Collection> collections;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text("Recommended follow ups", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: collections.length,
            itemBuilder: (context, index) {
              var collection = collections[index];
              return CompactRequestCard(
                title: collection.title,
                description: collection.description,
                relatedContactIds: collection.relatedContactIds,
                allRelatedContacts: const [], 
                compactionMode: CompactionMode.withoutRequest
              );
            },
          ),
        ),
      ],
    );
  }
}
    