import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/models/reminder_model.dart';
import 'package:prayer_ml/prayers/home/repos/reminder_repo.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:prayer_ml/shared/widgets.dart';

class HomePageConsumer extends ConsumerWidget {
  const HomePageConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(fetchReminderRecommendationsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Prayer Reminders")),
      body: switch (viewModel) {
          AsyncData(:final value) => ReminderDashboard(reminders: value),
          AsyncError(:final error, :final stackTrace) => PrintError(
              caller: "PrayerRequestConsumer",
              error: error,
              stackTrace: stackTrace),
          _ => const Center(child: CircularProgressIndicator()),
        },
    );
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

          // Scrollable "Recently Happened" Section
          const SliverToBoxAdapter(
            child: _SectionTitle(title: "Recently Happened"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var reminder = reminders[index];
                return PrayerCard(reminder: reminder);
              },
              childCount: 5, // Example data count
            ),
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
class PrayerCard extends StatelessWidget {
  final Reminder reminder;

  const PrayerCard({
    super.key,
    required this.reminder
  });

  @override
  Widget build(BuildContext context) {
    var prayerCollection = reminder.prayerCollection;
    var group = reminder.group.name;
    var user = prayerCollection.user.name;
    var urgencyLabel = prayerCollection.followUpRankLabel;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(prayerCollection.title ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: [
            Text("$group  |  $user"),
            Row(
              children: [
                _getUrgencyIcon(urgencyLabel),
                const SizedBox(width: 4),
                Text(urgencyLabel),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 4),
                Text(dateToTextualDate(prayerCollection.createdAt)),
              ],
            )
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle, color: Colors.green),
          onPressed: () {
            // Handle marking as prayed
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Marked as prayed!")),
            );
          },
        ),
      ),
    );
  }
}

Icon _getUrgencyIcon(String urgencyLabel) {
  switch (urgencyLabel) {
    case "High":
      return const Icon(Icons.warning, color: Colors.red);
    case "Medium":
      return const Icon(Icons.warning, color: Colors.orange);
    case "Low":
      return const Icon(Icons.warning, color: Colors.yellow);
    default:
      return const Icon(Icons.warning, color: Colors.grey);
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