import 'package:flutter_riverpod/flutter_riverpod.dart';


// GroupSettings allows the user to rename the group, change the description, and add or remove members
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

class GroupSettings extends ConsumerStatefulWidget {
  const GroupSettings({super.key, required this.groupContacts});

  final GroupContacts groupContacts;

  @override
  ConsumerState<GroupSettings> createState() => _GroupSettingsState();
}
class _GroupSettingsState extends ConsumerState<GroupSettings> {
  var _name = '';
  var _description = '';
  
  @override
  void initState() {
    super.initState();
    _name = widget.groupContacts.group.name;
    _description = widget.groupContacts.group.description ?? "";
  }


  @override
  Widget build(BuildContext context) {
    var groupContacts = widget.groupContacts;
    var newGroup = Group(id: groupContacts.group.id, name: _name, description: _description);

    return Scaffold(
      appBar: AppBar(
        title: Text(groupContacts.group.name),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: groupContacts.group.name,
            decoration: const InputDecoration(
              labelText: 'Group Name',
              hintText: 'Enter a new group name',
            ),
            onChanged: (value) => _name = value,
          ),
          TextFormField(
            initialValue: groupContacts.group.description,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Enter a new description',
            ),
            onChanged: (value) => _description = value,
          ),
          Row(
            spacing: 20,
            children: [
              // Delete float left most
              DeleteGroupButton(groupId: groupContacts.group.id),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              InteractiveLoadButton(
                customProvider: () => ref.read(groupContactsRepoProvider.notifier).saveGroup(newGroup),
                buttonText: 'Save group',
                buttonStyle: saveButtonStyle,
                successCallback: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: groupContacts.members
                  .map((member) => EditUserForGroup(user: member, groupId: groupContacts.group.id))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteGroupButton extends ConsumerWidget {
  const DeleteGroupButton({super.key, required this.groupId});

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text('Delete Group'),
            content: const Text('Are you sure you want to delete this group?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              InteractiveLoadButton(
                customProvider: () => ref.read(groupContactsRepoProvider.notifier).removeGroup(groupId),
                buttonText: 'Delete',
                successCallback: () {
                  var nav = Navigator.of(context);
                  nav.pop();
                  nav.pop();
                },
              ),
            ],
          );
        }),
      },
      style: deleteButtonStyle,
      child: const Text('Delete Group'),
    );
  }
}

class EditUserForGroup extends ConsumerWidget {
  const EditUserForGroup({super.key, required this.user, required this.groupId});

  final Contact user;
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                InteractiveLoadButton(
                  customProvider: () => ref.read(groupContactsRepoProvider.notifier).removeContactFromGroup(groupId, user.id),
                  buttonText: 'Delete',
                  buttonStyle: deleteButtonStyle,
                ),
              ],
            );
          }),
        },
      ),
    );
  }
}

class UserSettings extends ConsumerStatefulWidget {
  const UserSettings({super.key, required this.contact});

  final Contact contact;

  @override
  ConsumerState<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends ConsumerState<UserSettings> {
  var _name = '';
  var _description = '';

  @override
  void initState() {
    super.initState();
    _name = widget.contact.name;
    _description = widget.contact.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    var contact = widget.contact;
    var newContact = Contact(id: contact.id, name: _name, description: _description, createdAt: contact.createdAt);

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: contact.name,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter a new name',
            ),
            onChanged: (value) => _name = value,
          ),
          TextFormField(
            initialValue: contact.description,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Enter a new description',
            ),
            onChanged: (value) => _description = value,
          ),
          Row(
            spacing: 20,
            children: [
              // Delete float left most
              DeleteUserButton(contactId: contact.id),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              InteractiveLoadButton(
                customProvider: () => ref.read(groupContactsRepoProvider.notifier).saveContact(newContact),
                buttonText: 'Save user',
                buttonStyle: saveButtonStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DeleteUserButton extends ConsumerWidget {
  const DeleteUserButton({super.key, required this.contactId});

  final int contactId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text('Delete User'),
            content: const Text('Are you sure you want to delete this user?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              InteractiveLoadButton(
                customProvider: () => ref.read(groupContactsRepoProvider.notifier).removeContact(contactId),
                buttonText: 'Delete',
                successCallback: () {
                  Navigator.of(context).pop();
                },
                buttonStyle: deleteButtonStyle,
              ),
            ],
          );
        }),
      },
      style: deleteButtonStyle,
      child: const Text('Delete User'),
    );
  }
}