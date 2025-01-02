

// GroupSettings allows the user to rename the group, change the description, and add or remove members
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/shared/widgets.dart';

class GroupSettings extends ConsumerWidget {
  const GroupSettings({super.key, required this.group});

  final GroupContacts group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: group.name,
            decoration: const InputDecoration(
              labelText: 'Group Name',
              hintText: 'Enter a new group name',
            ),
          ),
          TextFormField(
            initialValue: group.description,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Enter a new description',
            ),
          ),
          Row(
            spacing: 20,
            children: [
              // Delete float left most
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: deleteButtonStyle,
                child: const Text('Delete'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: saveButtonStyle,
                child: const Text('Save'),
              ),
            ],
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: group.members
                  .map((member) => EditUser(user: member))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class EditUser extends StatelessWidget {
  const EditUser({super.key, required this.user});

  final Contact user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.description ?? ""),
        trailing: const Icon(Icons.delete),
        onTap: () => {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text('Delete User'),
              content: Text('Are you sure you want to delete ${user.name}?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Delete'),
                ),
              ],
            );
          }),
        },
      ),
    );
  }
}