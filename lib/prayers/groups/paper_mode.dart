

import 'dart:async';

import 'package:flutter/material.dart';
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
  const PaperMode({super.key, required this.groupContacts});

  final GroupContacts groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: [
          const OptionsHeader(),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child:  Paper(group: groupContacts.group),
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
  const Paper({super.key, required this.group});

  final Group group;

  @override
  ConsumerState<Paper> createState() => _PaperState();
}
class _PaperState extends ConsumerState<Paper> {
  Widget usernameBreak(PrayerRequest prayerRequest) {
    return PaperMarginSpace(
      paperLine: Text(
        prayerRequest.user.name, 
        textAlign: TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }

  Widget dateBreak(PrayerRequest prayerRequest) {
    return PaperMarginSpace(
      paperLine: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const ScribbleDivider(color: Colors.black),
            const SizedBox(height: 3),
            Text(formatTimestamp(prayerRequest.createdAt),
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
    var provider = paginatedPrayerRequestsNotifierProvider(10, widget.group.id);
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
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [endItemView, dateBreak(data.items[index-1]), usernameBreak(data.items[index-1])]);
            }
            var request = data.items[index];
            List<Widget> widgets = [];
            if (state.aiMode) {
              widgets.add(ViewableRequest(request: request));
            } else {
              widgets.add(EditableRequest(prayerRequest: data.items[index]));
            }

            if (index > 0 && daysBetween(DateTime.parse(data.items[index].createdAt), DateTime.parse(data.items[index-1].createdAt)) > 1) {
              widgets.add(dateBreak(data.items[index-1]));
              widgets.add(usernameBreak(data.items[index-1]));
            } else if (index > 0 && data.items[index].user.id != data.items[index-1].user.id) {
              widgets.add(usernameBreak(data.items[index-1]));
            }

            
            if (index == 0) {
              var newPrayerRequest = defaultPrayerRequest(request.user, request.group);
              widgets.add(dateBreak(newPrayerRequest));
              widgets.add(EditableRequest(prayerRequest: newPrayerRequest)); // New unsaved entry
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
              Text(request.title ?? "", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(request.description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 12),
              Text("Created At: ${dateTimeToDate(request.createdAt)}", style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              LoadableRelatedContacts(contactId: request.user.id),
              LoadableCollection(requestId: request.id, contactId: request.user.id),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = request.title != "" ? request.title : request.description;

    return InkWell(
      onTap: () => _showDetailSheet(context, ref),
      child: PaperMarginSpace(
        icon: const Icon(Icons.info_outline, size: 16, color: Colors.grey),
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


class LoadableRelatedContacts extends ConsumerWidget {
  const LoadableRelatedContacts({super.key, required this.contactId});

  final int contactId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var relatedContacts = ref.watch(fetchRelatedContactsProvider(contactId));
    return switch(relatedContacts) {
      AsyncData(:final value) => Text(relatedContactsFullDescription(value)),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "LoadableRelatedContacts", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
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
      _ => const CircularProgressIndicator(),
    };
  }
}


class EditableRequest extends ConsumerStatefulWidget {
  const EditableRequest({super.key, required this.prayerRequest});
  final PrayerRequest prayerRequest;

  @override
  ConsumerState<EditableRequest> createState() => _EditableRequestState();
}

class _EditableRequestState extends ConsumerState<EditableRequest> {
  late TextEditingController _controller;
  Timer? _debounce;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  SaveState _saveState = SaveState.noAction;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.prayerRequest.description,
    );
    _focusNode.addListener(_onFocusChange);
  }

  void _onChanged(String text) {
    setState(() => _saveState = SaveState.saving);

    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () async {
      try {
        var newRequest = widget.prayerRequest.copyWith(description: text);
        if (widget.prayerRequest.id == 0) {
          await saveNewRequest(newRequest);
        } else {
          await updateRequest(newRequest);
        }
        setState(() => _saveState = SaveState.saved);
      } catch (_) {
        setState(() => _saveState = SaveState.failed);
      }
    });
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      if (_saveState == SaveState.noAction && _isFocused) {
        _saveState = SaveState.editing;
      } else if (_saveState == SaveState.editing && !_isFocused) {
        _saveState = SaveState.noAction;
      }
    });
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

    return PaperMarginSpace(
      icon: icon,
      paperLine: Expanded(
          child: Row(
            children: [
              const Text("• "),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  onChanged: _onChanged,
                  maxLines: null,
                  decoration: InputDecoration(border: _isFocused ? const UnderlineInputBorder() : InputBorder.none),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

enum SaveState { saving, saved, failed, editing, noAction }

// NewRequestsManager is a widget that manages new requests created by the user at the bottom of the page.
// It handles the state of who the current request is for and displaying all the newly created requests.
class NewRequestsManager extends ConsumerStatefulWidget {
  const NewRequestsManager({super.key, required this.currentGroup, required this.allGroupContacts});
  final GroupContacts currentGroup;
  final List<GroupContacts> allGroupContacts;

  @override
  ConsumerState<NewRequestsManager> createState() => _NewRequestsManagerState();
}

class _NewRequestsManagerState extends ConsumerState<NewRequestsManager> {
  List<PrayerRequest> _newRequests = [];

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(paperModeSharedStateProvider);
    if (state.selectedUser == null) {
      return TypeAheadField<Contact>(
        itemBuilder: (context, Contact suggestion) {
          return ListTile(
            title: Text(suggestion.name),
          );
        },
        suggestionsCallback: (String suggestion) {
          
        },
        onSelected:(value) => state.setContact(value),
      );
    }
    return Column(
      children: [
        
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
    