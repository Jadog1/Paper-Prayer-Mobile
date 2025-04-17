import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

class ContactPageSettings extends ConsumerStatefulWidget {
  const ContactPageSettings({super.key, required this.contact, required this.group});

  final Contact contact;
  final Group group;

  @override
  ConsumerState<ContactPageSettings> createState() => _ContactPageSettingsState();
}

class _ContactPageSettingsState extends ConsumerState<ContactPageSettings> {
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
    var today = DateTime.now();
    var newContact = Contact(id: contact.id, name: _name, description: _description, createdAt: today.toString());

    return Column(
      children: [
        TextFormField(
          initialValue: contact.name,
          decoration: const InputDecoration(
            labelText: 'Contact Name',
            hintText: 'Enter a new contact name',
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
            DeleteContactButton(contactId: contact.id),
            const Spacer(),
            InteractiveLoadButton(
              customProvider: () async {
                if (contact.id == 0) {
                  ref.read(groupContactsRepoProvider.notifier).saveContact(newContact, widget.group);
                } else {
                  ref.read(groupContactsRepoProvider.notifier).updateContact(newContact);
                }
              },
              buttonText: 'Save',
              buttonStyle: saveButtonStyle,
              successCallback: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ],
    );
  }
}

class DeleteContactButton extends ConsumerWidget {
  const DeleteContactButton({super.key, required this.contactId});

  final int contactId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure you want to delete this contact?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(groupContactsRepoProvider.notifier).removeContact(contactId);
              var nav = Navigator.of(context);
              nav.pop();
              nav.pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
      style: deleteButtonStyle,
      child: const Text('Delete'),
    );
  }
}