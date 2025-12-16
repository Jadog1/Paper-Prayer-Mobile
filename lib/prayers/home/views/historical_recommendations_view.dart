import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/prayers/home/widgets/expandable_collection_card.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class HistoricalRecommendationsView extends ConsumerWidget {
  const HistoricalRecommendationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedHistoricalRecommendationNotifierProvider(10);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historical Recommendations"),
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
              final historicalRecommendation = data.items[index];
              final forDate = historicalRecommendation.forDate;
              return ExpandableCollectionCard(
                collection: historicalRecommendation.collection,
                style: CollectionCardStyle.purple,
                headerWidget: forDate != null
                    ? CollectionDateBadge.purple(
                        dateTime: DateTime.parse(forDate),
                        labelPrefix: 'Recommended ',
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
