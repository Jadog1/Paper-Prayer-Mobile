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
    var newContact = Contact(id: contact.id, name: _name, description: _description, createdAt: today.toString(), accountId: contact.accountId);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        children: [
          AppBar(
            title: const Text('Contact Settings'),
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: contact.name,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              labelText: 'Contact Name',
              hintText: 'Enter a new contact name',
            ),
            onChanged: (value) => setState(() {
              _name = value; 
            }),
          ),
          TextFormField(
            initialValue: contact.description,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Enter a new description',
            ),
            onChanged: (value) => setState(() {
              _description = value; 
            }),
          ),
          Row(
            spacing: 20,
            children: [
              // Delete float left most
              DeleteConfirmationButton(
                onDelete: () async{
                  await ref.read(groupContactsRepoProvider.notifier).removeContact(contact.id);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                onCancel: () => Navigator.of(context).pop(),
                deleteContext: 'contact',
                child: const Icon(Icons.delete),
              ),
              const Spacer(),
              InteractiveLoadButton(
                customProvider: () async {
                  if (contact.id == 0) {
                    await ref.read(groupContactsRepoProvider.notifier).saveContact(newContact, widget.group);
                  } else {
                    await ref.read(groupContactsRepoProvider.notifier).updateContact(newContact);
                  }
                },
                buttonText: 'Save',
                buttonStyle: saveButtonStyle,
                successCallback: () {
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        ],
      ),
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