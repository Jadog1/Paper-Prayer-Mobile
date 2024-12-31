import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:provider/provider.dart';

class PrayerRequestConsumer extends StatelessWidget {
  const PrayerRequestConsumer({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PrayerRequestViewModel(),
      child: Consumer<PrayerRequestViewModel>(
        builder: (context, viewModel, child) {
          return PrayerRequests(viewModel: viewModel);
        },
      ),
    );
  }
}

class PrayerRequests extends StatelessWidget {
  const PrayerRequests({super.key, required this.viewModel});

  final PrayerRequestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: viewModel.requests.map((request) {
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