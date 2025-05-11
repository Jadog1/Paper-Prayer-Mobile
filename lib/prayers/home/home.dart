import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:prayer_ml/shared/widgets.dart';

class HomePageConsumer extends ConsumerWidget {
  const HomePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(recommendationRepoProvider);
    return switch (viewModel) {
      AsyncData(:final value) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => RecommendationsDashboard(recommendations: value),
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
class RecommendationsDashboard extends StatelessWidget {
  const RecommendationsDashboard({super.key, required this.recommendations});

  final List<Recommendation> recommendations;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          // Sticky "Today's Focus" Section
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: _StickyHeaderDelegate(),
          ),

          SliverList.builder(
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              var recommendation = recommendations[index];
              var previousRecommendation = (index > 0) ? recommendations[index - 1] : null;
              var previousRecommendationLabel = previousRecommendation?.recommendationType ?? "";
              var widget = PrayerCard(recommendation: recommendation);
              if (recommendation.isSnoozed && previousRecommendation != null && !previousRecommendation.isSnoozed) {
                return Column(
                  children: [
                    const Divider(thickness: 1, color: Colors.grey),
                    const _SectionTitle(title: "Snoozed"),
                    _SectionTitle(title: recommendation.recommendationType),
                    widget,
                  ],
                );
              } else if (recommendation.recommendationType != previousRecommendationLabel) {
                return Column(
                  children: [
                    _SectionTitle(title: recommendation.recommendationType),
                    widget,
                  ],
                );
              }
              return widget;
            },
          ),
        ],
      );
  }
}

// Sticky Header Delegate for "Today's Focus"
class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 80;
  @override
  double get maxExtent => 120;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blueAccent,
      alignment: Alignment.centerLeft,
      child: const Text(
        "Today's Focus",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class PrayerCard extends ConsumerStatefulWidget {
  final Recommendation recommendation;

  const PrayerCard({
    super.key,
    required this.recommendation
  });

  @override
  ConsumerState<PrayerCard> createState() => _PrayerCardState();
}
class _PrayerCardState extends ConsumerState<PrayerCard> {
  bool useCollectionGranularDetails = false;

  @override
  Widget build(BuildContext context) {
    var recommendation = widget.recommendation;
    var prayerCollection = recommendation.prayerCollection;
    var urgencyLabel = prayerCollection.followUpRankLabel;
    var groupName = recommendation.group.name;
    var userName = prayerCollection.user.name;
    Widget? actions = InteractiveLoadButton(
        customProvider: () async {
            // Get the current timestamp plus the default count of days from now
            var utcTimestamp = DateTime.now().add(Duration(days: recommendation.defaultSnoozeDays)).toIso8601String();
            await ref.read(recommendationRepoProvider.notifier).updateAction(prayerCollection.id, CollectionRecommendationAction.prayed, utcTimestamp);
        },
        successCallback: () async => {
          if (context.mounted) {
            // Show a success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Marked as prayed!")),
            )
          }
        },
        buttonStyle: transparentButtonStyle,  
        childOverride: const Icon(Icons.snooze, color: Colors.green, size: 25),
      );
    // If snoozed and was updated today, then hide actions
    if (recommendation.isSnoozed && recommendation.updatedAt != null && isSameDateAsToday(recommendation.updatedAt!)) {
      actions = null; // Hide the action button
    }
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
            if (actions != null) ...[
              actions,
            ],
          ],
        ),
        subtitle: useCollectionGranularDetails ? 
          CollectionGranularDetail(prayerCollection: prayerCollection, recommendation: recommendation) :
          CollectionHighLevelDetail(userName: userName, groupName: groupName, recommendation: recommendation),
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
  final Recommendation recommendation;

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
            RequestDashboard(
              prayerWithAll: PrayerRequestWithAll(collection: recommendation.prayerCollection, 
              relatedContacts: [],
            )
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
    required this.userName,
    required this.groupName,
    required this.recommendation,
  });

  final String userName;
  final String groupName;
  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$userName  |  $groupName", textAlign: TextAlign.left,),
        _collectionDateInformation(recommendation),
      ],
    );
  }
}


Widget _collectionDateInformation(Recommendation recommendation) {
  Collection prayerCollection = recommendation.prayerCollection;

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

  List<Widget> snoozeState = [];
  if (recommendation.isSnoozed && recommendation.updatedAt != null) {
    snoozeState.add(const Icon(Icons.snooze));
    snoozeState.add(const SizedBox(width: 4));
    snoozeState.add(Expanded(child: Text("Snoozed until ${dateToTextualDate(recommendation.snoozeUntil!.toIso8601String())}")));
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
      Row(
        children: snoozeState,
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