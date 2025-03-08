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
    var viewModel = ref.watch(fetchReminderGroupsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Prayer Reminders")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: switch (viewModel) {
          AsyncData(:final value) => ReminderGroupContainer(reminderGroups: value),
          AsyncError(:final error, :final stackTrace) => PrintError(
              caller: "PrayerRequestConsumer",
              error: error,
              stackTrace: stackTrace),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class ReminderGroupContainer extends StatelessWidget {
  const ReminderGroupContainer({super.key, required this.reminderGroups});

  final List<ReminderGroups> reminderGroups;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminderGroups.length,
      itemBuilder: (context, index) {
        return ReminderGroupCard(reminderGroup: reminderGroups[index]);
      },
    );
  }
}

class ReminderGroupCard extends StatelessWidget {
  const ReminderGroupCard({super.key, required this.reminderGroup});

  final ReminderGroups reminderGroup;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(reminderGroup.count.toString(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        title: Text(
          reminderGroup.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(formatTimestamp(reminderGroup.maxCreatedAt)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

class IndividualPrayerRecommendation extends StatelessWidget {
  const IndividualPrayerRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recommended Prayer Request",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("This is where the recommended prayer request will appear."),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: const Text("View Request"),
            )
          ],
        ),
      ),
    );
  }
}
