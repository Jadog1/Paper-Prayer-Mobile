import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_view.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

class ContactPageSettings extends ConsumerStatefulWidget {
  const ContactPageSettings(
      {super.key, required this.contact, required this.group});

  final Contact contact;
  final GroupWithPermissions group;

  @override
  ConsumerState<ContactPageSettings> createState() =>
      _ContactPageSettingsState();
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
    var newContact = Contact(
      id: contact.id,
      name: _name.isEmpty ? contact.name : _name,
      description: _description.isEmpty ? contact.description : _description,
      createdAt: today.toString(),
      accountId: contact.accountId,
    );

    final isNewContact = contact.id == 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(isNewContact ? 'Add Member' : 'Edit Member'),
        backgroundColor: const Color(0xFF8B7355),
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          if (!isNewContact)
            IconButton(
              icon: const Icon(Icons.visibility_outlined),
              tooltip: 'View Contact',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactView(
                    contact: contact,
                    groupId: widget.group.id,
                  ),
                ),
              ),
            ),
          if (!isNewContact)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Delete Contact',
              onPressed: () => _showDeleteContactDialog(context),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contact Info Card
            _buildContactInfoCard(contact),

            const SizedBox(height: 24),

            // Action Buttons
            _buildActionButtons(context, newContact, isNewContact),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard(Contact contact) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B7355).withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF8B7355),
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Member Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: contact.name,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter member name',
                prefixIcon: const Icon(Icons.badge),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) => setState(() {
                _name = value;
              }),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: contact.description,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter a description (optional)',
                prefixIcon: const Icon(Icons.notes),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) => setState(() {
                _description = value;
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(
      BuildContext context, Contact newContact, bool isNewContact) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFF8B7355)),
              foregroundColor: const Color(0xFF8B7355),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Cancel', style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: InteractiveLoadButton(
            customProvider: () async {
              if (widget.contact.id == 0) {
                await ref
                    .read(groupContactsRepoProvider.notifier)
                    .saveContact(newContact, widget.group);
              } else {
                await ref
                    .read(groupContactsRepoProvider.notifier)
                    .updateContact(newContact);
              }
            },
            buttonText: isNewContact ? 'Add Member' : 'Save Changes',
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B7355),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
            successCallback: () {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }

  void _showDeleteContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red),
            SizedBox(width: 8),
            Text('Delete Contact'),
          ],
        ),
        content: const Text(
          'Are you sure you want to delete this contact? All their prayer requests will also be deleted. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref
                  .read(groupContactsRepoProvider.notifier)
                  .removeContact(widget.contact.id);
              if (context.mounted) {
                var nav = Navigator.of(context);
                nav.pop(); // Close dialog
                nav.pop(); // Close settings page
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
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
              ref
                  .read(groupContactsRepoProvider.notifier)
                  .removeContact(contactId);
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
