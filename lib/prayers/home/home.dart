import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:prayer_ml/shared/widgets.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class HomePageConsumer extends ConsumerWidget {
  const HomePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(recommendationRepoProvider);
    return switch (viewModel) {
      AsyncData(:final value) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => RecommendationGroups(recommendationGroups: value),
        ),
      ),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "PrayerRequestConsumer",
          error: error,
          stackTrace: stackTrace),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class RecommendationGroups extends ConsumerWidget {
  const RecommendationGroups({super.key, required this.recommendationGroups});
  final List<RecommendationGroup> recommendationGroups;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text(
            "Recommendations",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              letterSpacing: 1.1,
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: recommendationGroups.length,
            itemBuilder: (context, index) {
              return RecommendationGroupCard(recommendationGroups: recommendationGroups, index: index);
            },
          ),
        ),
      ]
    );
  }
}

// Create a new widget to display the recommendation groups. 
// The recommendation groups should use a card layout with a title, description, and icon.
class RecommendationGroupCard extends StatelessWidget {
  const RecommendationGroupCard({super.key, required this.recommendationGroups, required this.index});
  final List<RecommendationGroup> recommendationGroups;
  final int index;

  @override
  Widget build(BuildContext context) {
    var recommendationGroup = recommendationGroups[index];
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Recommendations(
              recommendationGroups: recommendationGroups,
              groupAt: index,
            ),
          ));
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                child: _recommendationGroupTypeIcon(recommendationGroup.icon),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendationGroup.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      recommendationGroup.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[700],
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}


Icon _recommendationGroupTypeIcon(String groupType) {
  switch (groupType) {
    case "priority":
      return const Icon(Icons.notification_important, color: Colors.blue);
    case "contact":
      return const Icon(Icons.person, color: Colors.green);
    default:
      return const Icon(Icons.question_mark, color: Colors.grey);
  }
}


class Recommendations extends StatefulWidget {
  const Recommendations({super.key, required this.recommendationGroups, required this.groupAt});

  final List<RecommendationGroup> recommendationGroups;
  final int groupAt;

  @override
  State<Recommendations> createState() => _RecommendationsState();
}
class _RecommendationsState extends State<Recommendations> {
  late int groupAt;

  @override
  void initState() {
    super.initState();
    groupAt = widget.groupAt;
  }

  @override
  Widget build(BuildContext context) {
    var provider = paginatedCollectionRecommendationNotifierProvider(10, widget.recommendationGroups[groupAt]);
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
              slivers: [
                // Sticky "Today's Focus" Section
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: _StickyHeaderDelegate(recommendationGroup: widget.recommendationGroups[groupAt]),
                ),
          
                
                SliverFillRemaining(
                  child: PagingHelperView(
                    provider: provider,
                    futureRefreshable: provider.future,
                    notifierRefreshable: provider.notifier,
                    contentBuilder: (data, widgetCount, endItemView) => ListView.builder(
                      itemCount: widgetCount,
                      reverse: false,
                      itemBuilder: (context, index) {
                         if (index == widgetCount - 1) {
                          return endItemView;
                        }
                        var recommendation = data.items[index];
                        var previousRecommendation = (index > 0) ? data.items[index - 1] : null;
                        var previousRecommendationLabel = previousRecommendation?.recommendationType ?? "";
                        var widget = Recommendation(recommendation: recommendation);
                        if (recommendation.recommendationType != previousRecommendationLabel) {
                          return Column(
                            children: [
                              _SectionTitle(title: recommendation.recommendationType),
                              widget,
                            ],
                          );
                        }
                        return widget;
                      },
                    )
                  ),
                ),
              ],
            ),
        ),
        RecommendationGroupTraversal(
          widget: widget, 
          groupAt: groupAt,
          backAction: () {
            setState(() {
              groupAt = (groupAt - 1) % widget.recommendationGroups.length;
            });
          },
          forwardAction: () {
            setState(() {
              groupAt = (groupAt + 1) % widget.recommendationGroups.length;
            });
          },
        )
      ],
    );
  }
}

class RecommendationGroupTraversal extends StatelessWidget {
  const RecommendationGroupTraversal({
    super.key,
    required this.widget,
    required this.groupAt,
    required this.backAction,
    required this.forwardAction,
  });

  final Recommendations widget;
  final int groupAt;
  final VoidCallback backAction;
  final VoidCallback forwardAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.withValues(alpha: 0.1),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () {
                backAction();
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.recommendationGroups[(groupAt - 1 + widget.recommendationGroups.length) % widget.recommendationGroups.length].title,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.withValues(alpha: 0.1),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.green),
              onPressed: () {
                forwardAction();
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.recommendationGroups[(groupAt + 1) % widget.recommendationGroups.length].title,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    ],
  ),
);

  }
}

// Sticky Header Delegate for "Today's Focus"
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _StickyHeaderDelegate({required this.recommendationGroup});
  final RecommendationGroup recommendationGroup;

  @override
  double get minExtent => 90;
  @override
  double get maxExtent => 130;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blueAccent,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          // Use app bar for title so that we can go back
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                recommendationGroup.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          Text(
            recommendationGroup.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

class Recommendation extends ConsumerStatefulWidget {
  final CollectionRecommendation recommendation;

  const Recommendation({
    super.key,
    required this.recommendation
  });

  @override
  ConsumerState<Recommendation> createState() => _RecommendationState();
}
class _RecommendationState extends ConsumerState<Recommendation> {
  bool useCollectionGranularDetails = false;

  @override
  Widget build(BuildContext context) {
    var recommendation = widget.recommendation;
    var prayerCollection = recommendation.collection;
    var urgencyLabel = prayerCollection.followUpRankLabel;
    return Card(
      elevation: 4, // Adjust elevation for more or less shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Optional rounded corners
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onLongPress: () {
          // Add a popup that allows the user to mark the request as not relevant
          markNotRelevant(context, ref, prayerCollection);
        },
        onTap: () {
          // Toggle the visibility of granular details
          setState(() {
            useCollectionGranularDetails = !useCollectionGranularDetails;
          });
        },
        title: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ensure text is visible
                    fontSize: 16, // Adjust as needed
                  ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle, // Aligns icon with text
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4), // Space between icon and text
                        child: _getUrgencyIcon(urgencyLabel), // Your urgency icon
                      ),
                    ),
                    TextSpan(
                      text: prayerCollection.title ?? "",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        subtitle: AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: CollectionHighLevelDetail(recommendation: recommendation),
          secondChild: CollectionGranularDetail(prayerCollection: prayerCollection, recommendation: recommendation),
          crossFadeState: useCollectionGranularDetails ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }

  Future<dynamic> markNotRelevant(BuildContext context, WidgetRef ref, Collection prayerCollection) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Mark as Not Relevant"),
          content: const Text("Are you sure you want to mark this request as not relevant?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                try {
                  // Call the API to mark as not relevant
                  await ref.read(recommendationRepoProvider.notifier).updateAction(prayerCollection.id, CollectionRecommendationAction.notRelevant, DateTime.now().toIso8601String());
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Failed to mark as not relevant")),
                    );
                  }
                }
                if (context.mounted) {
                  Navigator.of(context).pop(); // Close the dialog
                }
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}

class CollectionGranularDetail extends StatelessWidget {
  const CollectionGranularDetail({
    super.key,
    required this.prayerCollection,
    required this.recommendation,
  });

  final Collection prayerCollection;
  final CollectionRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Text(prayerCollection.description ?? ""),
      // Use a button on the bottom that spans the full width to open more details
      const SizedBox(height: 8),
      ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => 
            RequestDashboardLoader(
              collection: recommendation.collection,
            )),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        child: const Text("View Details"),
      ),
    ],
    );
  }
}

class CollectionHighLevelDetail extends StatelessWidget {
  const CollectionHighLevelDetail({
    super.key,
    required this.recommendation,
  });

  final CollectionRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    Collection pc = recommendation.collection;
    String username = pc.user.name;
    if (pc.relatedContacts.isNotEmpty) {
      username += " - ${relatedContactsAsString(pc.relatedContacts)}";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(username, textAlign: TextAlign.left,),
        _collectionDateInformation(recommendation),
      ],
    );
  }
}


Widget _collectionDateInformation(CollectionRecommendation recommendation) {
  Collection prayerCollection = recommendation.collection;

  List<Widget> dateRangeState = [];
  if (todayIsBetween(prayerCollection.startRangeOfEventDate, prayerCollection.endRangeOfEventDate)) {
    dateRangeState.add(const Icon(Icons.today));
    dateRangeState.add(const SizedBox(width: 4));
    dateRangeState.add(Expanded(child: Text("Happening now until ${dateToTextualDate(prayerCollection.endRangeOfEventDate!)}")));
  } else if (prayerCollection.startRangeOfEventDate != null) {
    dateRangeState.add(const Icon(Icons.hourglass_top));
    dateRangeState.add(const SizedBox(width: 4));
    dateRangeState.add(Expanded(child: Text("Happening ${dateToTextualDate(prayerCollection.startRangeOfEventDate!)}")));
  }

  return Column(
    children: [
      Row(
        children: [
          const Icon(Icons.book_outlined),
          const SizedBox(width: 4),
          Text("Updated ${dateToTextualDate(prayerCollection.updatedAt)}"),
        ],
      ),
      Row(
        children: dateRangeState,
      ),
      // If relevancyExpirationDate is not null, show the expiration date
      if (prayerCollection.relevancyExpirationDate != null) 
        Row(
          children: [
            // Show when this collection will expire
            const Icon(Icons.hourglass_bottom),
            const SizedBox(width: 4),
            Text("Expires ${dateToTextualDate(prayerCollection.relevancyExpirationDate!.toIso8601String())}"),
          ],
        ),
    ],
  );
}

Icon _getUrgencyIcon(String urgencyLabel) {
  switch (urgencyLabel) {
    case "High":
      return const Icon(Icons.warning, color: Colors.red);
    case "Medium":
      return const Icon(Icons.warning_amber, color: Colors.orange);
    case "Low":
      return const Icon(Icons.info, color: Colors.yellow);
    default:
      return const Icon(Icons.question_mark, color: Colors.grey);
  }
}

// Section Title
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}