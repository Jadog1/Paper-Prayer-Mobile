import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/repos/contact_repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';

import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/shared/widgets.dart';
// import 'view_model.dart';

class Groups extends ConsumerWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context).copyWith();

    return MaterialApp(
      theme: theme,
      home: const GroupConsumer(),
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

class GroupConsumer extends ConsumerWidget {
  const GroupConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(fetchGroupContactsProvider);

    return switch(viewModel) {
      AsyncData(:final value) => GroupView(groupContacts: value),
      AsyncError(:final error, :final stackTrace) => PrintError(caller: "GroupConsumer", error: error, stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  } // GroupView(viewModel: viewModel)
}

class GroupView extends ConsumerWidget {
  const GroupView({
    super.key,
    required this.groupContacts,
  });

  final List<GroupContacts> groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Title(
          color: Theme.of(context).colorScheme.primary,
          child: const Text("Groups"),
        ),
        Flexible(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: groupContacts
                .map((group) => GroupCard(
                      title: group.name,
                      subtitle: group.description,
                      members: group.members,
                    ))
                .toList(),
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
  final List<Contact> members; // List of member names

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ExpansionTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.people),
        children: members
            .map((member) => MemberCard(user: member))
            .toList(), // Show member cards when expanded
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      color: theme.colorScheme.secondary,
      child: ListTile(
        title: Text(user.name),
        textColor: theme.colorScheme.onSecondary,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PrayerRequestConsumer(user: user)),
        ),
      ),
    );
  }
}
