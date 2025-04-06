

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
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
    var state = ref.watch(paperModeSharedStateProvider);
    var text = prayerRequest?.description ?? '';
    var summary = prayerRequest?.title ?? '';
    var isAiModeCompatible = state.aiMode && summary.isNotEmpty;
    return Text("• ${isAiModeCompatible ? summary : text}",
      textAlign: TextAlign.left,

      style: TextStyle(
        fontSize: 16.0, 
        fontWeight: FontWeight.normal,
        fontStyle: isAiModeCompatible ? FontStyle.italic : FontStyle.normal,
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
    