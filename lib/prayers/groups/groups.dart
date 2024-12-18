import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).copyWith();

    return  MaterialApp(
      theme: theme,
      home: const GroupView(),
    );
    /*
    var pages = [
      // Example new top level page
      const MaterialPage(
        key: ValueKey('Home'),
        child: GroupView(),
      ),
    ];
Navigator(
      pages: pages,
      onDidRemovePage: (page) => {
        if (page.key == pages[0].key) {
          Navigator.of(context).pop()
        }
      },
    );
    */
  }
}

class GroupView extends StatelessWidget {
  const GroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title(
          color: Theme.of(context).colorScheme.primary,
          child: const Text("Groups"),
        ),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: const <Widget>[
              GroupCard(
                title: 'Group 1',
                subtitle: 'This is the first group.',
                members: ['John Doe', 'Jane Doe'],
              ),
              GroupCard(
                title: 'Group 2',
                subtitle: 'This is the second group.',
                members: ['Alice Smith', 'Bob Johnson'],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.members,
  });

  final String title;
  final String subtitle;
  final List<String> members; // List of member names

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ExpansionTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.people),
        children: members
            .map((member) => MemberCard(name: member))
            .toList(), // Show member cards when expanded
      ),
    );
  }
  
}

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      color: theme.colorScheme.secondary,
      child: ListTile(
        title: Text(name),
        textColor: theme.colorScheme.onSecondary,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PrayerRequests()),
        ),
      ),
    );
  }
}