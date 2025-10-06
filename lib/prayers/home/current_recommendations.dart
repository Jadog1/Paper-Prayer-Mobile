import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/shared/widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class CurrentRecommendationsView extends ConsumerWidget {
  final RecommendationGroup recommendationGroup;

  const CurrentRecommendationsView({
    super.key,
    required this.recommendationGroup,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedCollectionRecommendationNotifierProvider(10, recommendationGroup);

    return Scaffold(
      appBar: AppBar(
        title: Text(recommendationGroup.title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: PagingHelperView(
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
    );
  }
}

class CollectionRecommendationCard extends ConsumerStatefulWidget {
  final CollectionRecommendation recommendation;

  const CollectionRecommendationCard({
    super.key,
    required this.recommendation,
  });

  @override
  ConsumerState<CollectionRecommendationCard> createState() => _CollectionRecommendationCardState();
}

class _CollectionRecommendationCardState extends ConsumerState<CollectionRecommendationCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final collection = widget.recommendation.collection;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Collection header - always visible
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Collection title
                        Text(
                          collection.title ?? "Untitled",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Collection summary
                        Text(
                          collection.description ?? "",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),
          
          // Expanded section with highlights
          if (_isExpanded)
            _HighlightsSection(
              collection: collection,
            ),
        ],
      ),
    );
  }
}

class _HighlightsSection extends ConsumerWidget {
  final Collection collection;

  const _HighlightsSection({
    required this.collection,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlightsAsync = ref.watch(recentPrayerRequestsProvider(collection.id, n: 5));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Highlights list or loading indicator
          highlightsAsync.when(
            data: (prayerRequests) {
              if (prayerRequests.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "No recent prayer requests",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recent Highlights:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...prayerRequests.map((request) {
                    // Use highlight if available, otherwise use request description
                    final text = request.features?.highlight ?? request.description;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6.0),
                            child: Icon(
                              Icons.circle,
                              size: 6,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              text,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => PrintError(
              caller: "_HighlightsSection",
              error: error,
              stackTrace: stackTrace,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // View All Requests button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RequestDashboardLoader(
                    collection: collection,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text("View All Requests"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
