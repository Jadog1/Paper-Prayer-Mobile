import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
      metaBuilder: (context, isExpanded) => _RecommendationContextLine(
        closestPrayerEventDate: recommendation.closestPrayerEventDate,
        closestPrayerEventReason: recommendation.closestPrayerEventReason,
        isExpanded: isExpanded,
      ),
    );
  }
}

class _RecommendationContextLine extends StatelessWidget {
  final DateTime? closestPrayerEventDate;
  final String? closestPrayerEventReason;
  final bool isExpanded;

  const _RecommendationContextLine({
    required this.closestPrayerEventDate,
    required this.closestPrayerEventReason,
    required this.isExpanded,
  });

  String _formatEventDate(DateTime eventDate) {
    final now = DateTime.now();
    final difference = now.difference(eventDate);

    // Past (normal case): when it last surfaced.
    if (!difference.isNegative) {
      if (difference.inMinutes < 1) return 'just now';
      if (difference.inHours < 1) return '${difference.inMinutes}m ago';
      if (difference.inHours < 24) return '${difference.inHours}h ago';
      if (difference.inDays < 7) return '${difference.inDays}d ago';
      if (now.year == eventDate.year)
        return DateFormat('MMM d').format(eventDate);
      return DateFormat('MMM d, yyyy').format(eventDate);
    }

    // Future: scheduled/expected to surface.
    final future = eventDate.difference(now);
    if (future.inMinutes < 60) return 'in ${future.inMinutes}m';
    if (future.inHours < 24) return 'in ${future.inHours}h';
    if (future.inDays < 7) return 'in ${future.inDays}d';
    return DateFormat('MMM d').format(eventDate);
  }

  @override
  Widget build(BuildContext context) {
    final hasDate = closestPrayerEventDate != null;
    final reason = (closestPrayerEventReason ?? '').trim();
    final hasReason = reason.isNotEmpty;

    if (!hasDate && !hasReason) {
      return const SizedBox.shrink();
    }

    final parts = <String>[];
    if (hasDate) {
      parts.add('Surfaced ${_formatEventDate(closestPrayerEventDate!)}');
    }
    if (hasReason) {
      parts.add(reason);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.auto_awesome,
          size: 14,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            parts.join(' · '),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              height: 1.25,
            ),
            maxLines: isExpanded ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
