import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/home/models/reminder_model.dart';
import 'package:prayer_ml/prayers/home/repos/reminder_repo.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:prayer_ml/shared/widgets.dart';

class HomePageConsumer extends ConsumerWidget {
  const HomePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(recommendationRepoProvider);
    return switch (viewModel) {
      AsyncData(:final value) => ReminderDashboard(reminders: value),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "PrayerRequestConsumer",
          error: error,
          stackTrace: stackTrace),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
class ReminderDashboard extends StatelessWidget {
  const ReminderDashboard({super.key, required this.reminders});

  final List<Reminder> reminders;

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
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              var reminder = reminders[index];
              var previousReminder = (index > 0) ? reminders[index - 1] : null;
              var previousReminderLabel = previousReminder?.reminderLabel ?? "";
              var widget = PrayerCard(recommendation: reminder);
              if (reminder.isSnoozed && previousReminder != null && !previousReminder.isSnoozed) {
                return Column(
                  children: [
                    const Divider(thickness: 1, color: Colors.grey),
                    const _SectionTitle(title: "Snoozed"),
                    _SectionTitle(title: reminder.reminderLabel),
                    widget,
                  ],
                );
              } else if (reminder.reminderLabel != previousReminderLabel) {
                return Column(
                  children: [
                    _SectionTitle(title: reminder.reminderLabel),
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

// Prayer Request Card
class PrayerCard extends ConsumerWidget {
  final Reminder recommendation;

  const PrayerCard({
    super.key,
    required this.recommendation
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prayerCollection = recommendation.prayerCollection;
    var urgencyLabel = prayerCollection.followUpRankLabel;
    var groupName = recommendation.group.name;
    var userName = prayerCollection.user.name;
    List<Widget> actions = [
      const Spacer(),
      InteractiveLoadButton(
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
        childOverride: const Icon(Icons.mark_as_unread, color: Colors.green, size: 20),
      )
    ];
    // If snoozed and was updated today, then hide actions
    if (recommendation.isSnoozed && recommendation.updatedAt != null && isSameDateAsToday(recommendation.updatedAt!)) {
      actions = [];
    }
    return Card(
      elevation: 4, // Adjust elevation for more or less shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6), // Optional rounded corners
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(prayerCollection.title ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$userName  |  $groupName", textAlign: TextAlign.left,),
            Row(
              children: [
                _urgencyLabel(urgencyLabel),
                ...actions,
              ],
            ),
            _collectionDateInformation(recommendation),
          ],
        ),
      ),
    );
  }
}

Widget _urgencyLabel(String urgencyLabel) {
  return Row(
    children: [
      _getUrgencyIcon(urgencyLabel),
      const SizedBox(width: 4),
      Text(urgencyLabel),
    ],
  );
}

Widget _collectionDateInformation(Reminder recommendation) {
  Collection prayerCollection = recommendation.prayerCollection;

  List<Widget> dateRangeState = [];
  if (todayIsBetween(prayerCollection.startRangeOfEventDate, prayerCollection.endRangeOfEventDate)) {
    dateRangeState.add(const Icon(Icons.today));
    dateRangeState.add(const SizedBox(width: 4));
    dateRangeState.add(Text("Happening now until ${dateToTextualDate(prayerCollection.endRangeOfEventDate!)}"));
  } else if (prayerCollection.startRangeOfEventDate != null) {
    dateRangeState.add(const Icon(Icons.hourglass_top));
    dateRangeState.add(const SizedBox(width: 4));
    dateRangeState.add(Text("Happening ${dateToTextualDate(prayerCollection.startRangeOfEventDate!)}"));
  }

  List<Widget> snoozeState = [];
  if (recommendation.isSnoozed && recommendation.updatedAt != null) {
    snoozeState.add(const Icon(Icons.snooze));
    snoozeState.add(const SizedBox(width: 4));
    snoozeState.add(Text("Snoozed until ${dateToTextualDate(recommendation.snoozeUntil!.toIso8601String())}"));
  }

  return Column(
    children: [
      Row(
        children: [
          const Icon(Icons.edit_calendar),
          const SizedBox(width: 4),
          Text("Last updated ${dateToTextualDate(prayerCollection.updatedAt)}"),
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