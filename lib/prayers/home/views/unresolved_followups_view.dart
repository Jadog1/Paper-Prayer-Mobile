import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/prayers/home/widgets/expandable_collection_card.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class UnresolvedFollowupsView extends ConsumerWidget {
  final int lookbackDays;

  const UnresolvedFollowupsView({
    super.key,
    this.lookbackDays = 30,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedUnresolvedFollowupsNotifierProvider(10,
        lookbackDays: lookbackDays);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Unresolved Follow-ups"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: PagingHelperView(
          provider: provider,
          futureRefreshable: provider.future,
          notifierRefreshable: provider.notifier,
          contentBuilder: (data, widgetCount, endItemView) => ListView.builder(
            itemCount: widgetCount,
            itemBuilder: (context, index) {
              if (index == widgetCount - 1) {
                return endItemView;
              }
              final followup = data.items[index];
              return ExpandableCollectionCard(
                collection: followup.collection,
                style: CollectionCardStyle.orange,
                headerWidget: CollectionDateBadge.orange(
                  dateTime: followup.lastPrayerCreationDate,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
