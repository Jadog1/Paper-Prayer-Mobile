import 'package:flutter/material.dart';

class PrayerRequests extends StatelessWidget {
  const PrayerRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget> [
        RequestCard(title: 'Pray for my family', subtitle: 'John Doe'),
        RequestCard(title: 'Pray for my health', subtitle: 'Jane Doe'),
      ],
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
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