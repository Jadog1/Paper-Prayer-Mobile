

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode_view_model.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/notebook_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/prayers/prayers_shared/prayers_shared_widgets.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:prayer_ml/shared/widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class PaperMode extends ConsumerWidget {
  const PaperMode({super.key, required this.currentGroup});

  final GroupContacts currentGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(paperModeSharedStateProvider).init();
    return Column(
        children: [
          const OptionsHeader(),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child:  Paper(groupContacts: currentGroup),
            ),
          ),
        ],
      );
  }
} 

class OptionsHeader extends ConsumerWidget {
  const OptionsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(paperModeSharedStateProvider);
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Create a back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                children: [
                  const Text("Summary"),
                  Switch(
                    value: state.aiMode,
                    onChanged: (val) {
                      state.setAiMode(val);
                    },
                  ),
                ],
              ),
              TextButton.icon(
                icon: const Icon(Icons.auto_awesome),
                label: const Text("Follow up"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const RecommendedPrayerRequestsLoader(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Paper extends ConsumerStatefulWidget {
  const Paper({super.key, required this.groupContacts});

  final GroupContacts groupContacts;

  @override
  ConsumerState<Paper> createState() => _PaperState();
}
class _PaperState extends ConsumerState<Paper> {

  Widget dateBreak(String timestamp) {
    return PaperMarginSpace(
      paperLine: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const ScribbleDivider(color: Colors.black),
            const SizedBox(height: 3),
            Text(formatTimestamp(timestamp),
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = paginatedPrayerRequestsNotifierProvider(10, widget.groupContacts.group.id);
    var state = ref.watch(paperModeSharedStateProvider);
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
              if (data.items.isEmpty) {
                return NewRequestsManager(
                  previousRequest: null,
                  currentGroup: widget.groupContacts,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [endItemView, dateBreak(data.items[index-1].createdAt), usernameBreak(data.items[index-1])]);
            }
            var request = data.items[index];

            List<Widget> widgets = [];
            if (state.hiddenPrayerRequests.containsKey(request.id) == false) {
              widgets.add(PaperBlock(
                prayerRequest: request,
                currentGroup: widget.groupContacts,
                allowsAIMode: true,
              ));
            }

            if (index > 0 && daysBetween(DateTime.parse(data.items[index].createdAt), DateTime.parse(data.items[index-1].createdAt)) >= 1) {
              widgets.add(dateBreak(data.items[index-1].createdAt));
              widgets.add(usernameBreak(data.items[index-1]));
            } else if (index > 0 && data.items[index].user.id != data.items[index-1].user.id) {
              widgets.add(usernameBreak(data.items[index-1]));
            }

            
            if (index == 0) {
              PrayerRequest? previousRequest;
              if (daysBetween(DateTime.parse(data.items[index].createdAt), DateTime.now()) >= 1) {
                widgets.add(dateBreak(DateTime.now().toIso8601String()));
                previousRequest = data.items[index];
              }

              widgets.add(NewRequestsManager(
                previousRequest: previousRequest,
                currentGroup: widget.groupContacts,
              )); // New unsaved entry
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

// PaperBlock is a widget that represents a block of text in the paper mode view.
// This can be a ViewableRequest, EditableRequest, or UserSearch.
// It manages state between swapping modes.
// It should accept a property "prayerRequest".
// It will rely on the PaperModeSharedState for determining whether view/edit mode is active or not. 
// It will rely on the shared state to determine whether a current user is selected or not. If not, it will use a UserSearch widget.
// Additionally, if a user taps and holds on a block, it should animate to swap between view/edit mode.
class PaperBlock extends ConsumerStatefulWidget {
  const PaperBlock({super.key, 
    required this.prayerRequest, required this.currentGroup,
    this.allowsAIMode = false, this.newRequest = false,
  });

  final PrayerRequest prayerRequest;
  final GroupContacts currentGroup;
  final bool allowsAIMode;
  final bool newRequest;

  @override
  ConsumerState<PaperBlock> createState() => _PaperBlockState();
}
class _PaperBlockState extends ConsumerState<PaperBlock> {
  final FocusNode _editFocusNode = FocusNode();
  final FocusNode _userSelectionFocusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  bool _changingUser = false;

  void onChange(String text) {
    var changingUser = text.startsWith("@");
    if (changingUser != _changingUser) {
      setState(() {
        _changingUser = changingUser;
      });
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
    if (widget.prayerRequest.id == 0) {
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
    var state = ref.watch(paperModeSharedStateProvider);
    var useViewableRequest = state.aiMode && widget.allowsAIMode;
    var requiresUserSelection = state.selectedUser == null && widget.newRequest;
    if (requiresUserSelection || _changingUser) {
      return UserSelection(
        currentGroup: widget.currentGroup,
        controller: _controller,
        changeCallback: (ContactAndGroupPair contactAndGroupPair) {
          state.setContact(contactAndGroupPair);
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
      return ViewableRequest(request: widget.prayerRequest);
    }
    return EditableRequest(
      prayerRequest: widget.prayerRequest, 
      focusNode: _editFocusNode, 
      newRequest: widget.newRequest,
      controller: _controller,
    );
  }
}

Widget usernameBreak(PrayerRequest prayerRequest) {
  var name = prayerRequest.user.name;
  if (name.isEmpty) {
    name = "No name";
  }
  return PaperMarginSpace(
    paperLine: Text(
      name, 
      textAlign: TextAlign.left,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ),
  );
}

class ScribbleDivider extends StatelessWidget {
  const ScribbleDivider({
    super.key,
    this.color = Colors.grey,
    this.height = 1,
  });

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _ScribblePainter(color: color),
      ),
    );
  }
}

class _ScribblePainter extends CustomPainter {
  _ScribblePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Start scribbly path from left to right
    const wiggleHeight = 2.0;
    const waveLength = 8.0;

    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= size.width; x += waveLength) {
      final y = (x ~/ waveLength) % 2 == 0
          ? size.height / 2 - wiggleHeight
          : size.height / 2 + wiggleHeight;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


class ViewableRequest extends ConsumerWidget {
  const ViewableRequest({
    super.key,
    required this.request,
  });

  final PrayerRequest request;

  void _showDetailSheet(BuildContext context, WidgetRef ref) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(request.features?.title ?? "", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(request.description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 12),
              Text("Created At: ${dateTimeToDate(request.createdAt)}", style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              LoadableRelatedContacts(contactId: request.user.id),
              LoadableCollection(requestId: request.id, contactId: request.user.id),
              LoadableBibleVerses(requestId: request.id),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = request.features != null ? request.features!.title : request.description;

    return InkWell(
      onTap: () => _showDetailSheet(context, ref),
      child: PaperMarginSpace(
        // icon: const Icon(Icons.info_outline, size: 16, color: Colors.grey),
        paperLine: Expanded(
          child: Text(
            "• $summary",
            textAlign: TextAlign.left,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class LoadableBibleVerses extends ConsumerWidget {
  const LoadableBibleVerses({super.key, required this.requestId});

  final int requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var bibleVerses = ref.watch(fetchBibleVersesForPrayerRequestProvider(requestId));
    
    return switch(bibleVerses) {
      AsyncData(:final value) => BibleVerseList(verses: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "LoadableBibleVerses", error: error, stackTrace: stackTrace),
      _ => const Text("Loading Bible verses..."),
    };
  }
}

class BibleVerseList extends StatelessWidget {
  final List<BibleReferenceAndText> verses;

  const BibleVerseList({
    super.key,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    // Limit to the first couple of verses
    final displayedVerses = verses.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: displayedVerses.map((verse) {
        final ref = verse.modelOutput.reference;
        final referenceLabel = "${ref.bookOfTheBible} ${ref.chapter}:${ref.verseStart}${ref.verseEnd != ref.verseStart ? "-${ref.verseEnd}" : ""}";

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$referenceLabel ",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Expanded(
                child: Text(
                  verse.text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}


class LoadableRelatedContacts extends ConsumerWidget {
  const LoadableRelatedContacts({super.key, required this.contactId});

  final int contactId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var relatedContacts = ref.watch(fetchRelatedContactsProvider(contactId));
    return switch(relatedContacts) {
      AsyncData(:final value) => Text(relatedContactsFullDescription(value)),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "LoadableRelatedContacts", error: error, stackTrace: stackTrace),
      _ => const Text("Loading related contacts..."),
    };
  }
}

class LoadableCollection extends ConsumerWidget {
  const LoadableCollection({super.key, required this.requestId, required this.contactId});

  final int contactId;
  final int requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(fetchCollectionFromRequestProvider(requestId, contactId));
    return switch(provider) {
      AsyncData(:final value) => value != null ? CompactRequestCard(
            title: value.collection.title, 
            description: value.collection.description,
            relatedContactIds: value.collection.relatedContactIds,
            allRelatedContacts: value.relatedContacts,
            // child: CompactRequestButtonGroup(request: value, allRelatedContacts: prayerRequestContact.relatedContacts),
          ) : const Text("No collection"),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "LoadableCollection", error: error, stackTrace: stackTrace),
      _ => const Text("Loading collection..."),
    };
  }
}


class EditableRequest extends ConsumerStatefulWidget {
  const EditableRequest({super.key, 
    required this.prayerRequest, required this.focusNode,
    required this.controller,
    this.newRequest = false,  
  });

  final PrayerRequest prayerRequest;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool newRequest;

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
    var state = ref.read(paperModeSharedStateProvider);
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
      }
    });
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter && widget.newRequest) {
      var state = ref.read(paperModeSharedStateProvider);
      var user = state.selectedUser;
      if (user == null) {
        return KeyEventResult.ignored;
      }
      if (widget.controller.text.isEmpty) {
        return KeyEventResult.handled;
      }
      state.addDefaultPrayerRequest(user);
      return KeyEventResult.handled;
    }
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace && widget.controller.text.isEmpty) {
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
                    decoration: InputDecoration(border: _isFocused ? const UnderlineInputBorder() : InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}

enum SaveState { saving, saved, failed, editing, noAction }

class UserSelection extends ConsumerStatefulWidget {
  const UserSelection({super.key, 
    required this.currentGroup, required this.focusNode,
    required this.controller,
    this.changeCallback,
  });

  final GroupContacts currentGroup;
  final void Function(ContactAndGroupPair)? changeCallback;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  ConsumerState<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends ConsumerState<UserSelection> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(paperModeSharedStateProvider);
    return PaperMarginSpace(
      icon: const Icon(Icons.person_add, size: 16),
      paperLine: Expanded(
        child: TypeAheadField<ContactAndGroupPair>(
          focusNode: widget.focusNode,
          autoFlipDirection: true,
          controller: widget.controller,
          builder:(context, controller, focusNode) => TextField(
            controller: controller,
            focusNode: focusNode,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: "Who are you praying for?",
              border: UnderlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
          ),
          itemBuilder: (context, ContactAndGroupPair suggestion) {
            if (suggestion.contact.id == 0 && suggestion.contact.name == "Create new contact") {
              return ListTile(
                title: Text(suggestion.contact.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            }
            return ListTile(
              title: Text(suggestion.contact.name),
              subtitle: Text(suggestion.contact.description ?? ""),
            );
          },
          suggestionsCallback: (String suggestion) {
            if (suggestion.startsWith("@")) {
              suggestion = suggestion.substring(1);
            }
            if (suggestion.isEmpty) {
              return Future.value(null);
            }
            var filteredContacts = widget.currentGroup.memberWithContactGroupPairs.where((member) {
              return member.contact.name.toLowerCase().contains(suggestion.toLowerCase());
            }).toList();
            filteredContacts.add(ContactAndGroupPair(
              contact: Contact(id: 0, name: "Create new contact", description: "", createdAt: DateTime.now().toIso8601String(), accountId: 0),
              groupPair: ContactGroupPairs(id: 0, groupId: widget.currentGroup.group.id, contactId: 0, createdAt: DateTime.now().toIso8601String()),
            ));
            return Future.value(filteredContacts);
          },
          onSelected:(value) async { 
            if (value.contact.id == 0 && value.contact.name == "Create new contact") {
              try {
                var name = widget.controller.text;
                if (name.startsWith("@")) {
                  name = name.substring(1);
                }
                var newContact = Contact(id: 0, name: name, description: "", createdAt: DateTime.now().toIso8601String(), accountId: 0);
                newContact = await ref.read(groupContactsRepoProvider.notifier)
                  .saveContact(newContact, widget.currentGroup.group);
                var contactGroupPair = await ref.read(fetchContactGroupProvider(newContact.id, widget.currentGroup.group.id).future);
                value = ContactAndGroupPair(contact: newContact, groupPair: contactGroupPair);
                widget.currentGroup.memberWithContactGroupPairs.add(value);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("An error occured. Please try again.")),
                  );
                  log('Error in UserSelection', error: e);
                }
                return;
              }
            }
            state.setContact(value);
            setState(() {
              widget.controller.clear();
            });
            if (widget.changeCallback != null) {
              widget.changeCallback!(value);
            }
          }
        ),
      ),
    );
  }
}

// NewRequestsManager is a widget that manages new requests created by the user at the bottom of the page.
// It handles the state of who the current request is for and displaying all the newly created requests.
class NewRequestsManager extends ConsumerStatefulWidget {
  const NewRequestsManager({super.key, required this.currentGroup, required this.previousRequest});

  final GroupContacts currentGroup;
  final PrayerRequest? previousRequest;

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
    var state = ref.watch(paperModeSharedStateProvider);
    var newRequests = state.newRequests;
    return Column(
      children: [
        for (var i = 0; i < newRequests.length; i++) ...[
          if (
              (
                (i == 0 && (widget.previousRequest == null || newRequests[i].user.id != widget.previousRequest!.user.id))
                || 
                ( i > 0 && newRequests[i].user.id != newRequests[i - 1].user.id)
              )
              &&
              state.selectedUser != null
            )
            usernameBreak(newRequests[i]),
            
          PaperBlock(
            prayerRequest: newRequests[i], 
            currentGroup: widget.currentGroup, 
            newRequest: true,
          ),
        ],
      ],
    );
  }
}


class PaperMarginSpace extends StatelessWidget {
  const PaperMarginSpace({super.key, this.icon, required this.paperLine});

  final Widget? icon;
  final Widget paperLine;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: Colors.grey)),
                  ),
                  child: Align(
                    child: icon ?? const SizedBox(width: 16),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          paperLine,
        ],
      ),
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
    var recommendedRequests = ref.watch(fetchRecommendationsProvider(state.selectedUser!.contact.id));
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
    