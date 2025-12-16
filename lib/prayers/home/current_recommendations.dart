import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/prayers/home/widgets/expandable_collection_card.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class CurrentRecommendationsView extends ConsumerWidget {
  final RecommendationGroup recommendationGroup;

  const CurrentRecommendationsView({
    super.key,
    required this.recommendationGroup,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedCollectionRecommendationNotifierProvider(
        10, recommendationGroup);

    return Scaffold(
      appBar: AppBar(
        title: Text(recommendationGroup.title),
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
              final recommendation = data.items[index];
              return CollectionRecommendationCard(
                recommendation: recommendation,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CollectionRecommendationCard extends ConsumerWidget {
  final CollectionRecommendation recommendation;

  const CollectionRecommendationCard({
    super.key,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpandableCollectionCard(
      collection: recommendation.collection,
      style: CollectionCardStyle.blue,
      headerWidget: CollectionDateBadge.blue(
        dateTime: recommendation.lastPrayerCreationDate,
      ),
    );
  }
}
