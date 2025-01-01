import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

class PrayerRequestConsumer extends ConsumerWidget {
  const PrayerRequestConsumer({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(fetchPrayerRequestsProvider(user.id));
    return switch(viewModel) {
      AsyncData(:final value) => PrayerRequests(viewModel: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "PrayerRequestConsumer", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  }
}

class PrayerRequests extends StatelessWidget {
  const PrayerRequests({super.key, required this.viewModel});

  final List<PrayerRequest> viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: viewModel.map((request) {
        return RequestCard(request: request);
      }).toList(),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request});

  final PrayerRequest request;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ListTile(
        title: Text(request.request),
        subtitle: Text(request.user.name),
        trailing: const Icon(Icons.handshake),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const RequestDashboard())
        ),
      ),
    );
  }
}

class RequestDashboard extends StatelessWidget {
  const RequestDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Build a dashboard component that shows similar history, stats, and other information
    return const Row(
      children: <Widget> [
        Text("History"),
        Text("Stats"),
      ],
    );
  }
}