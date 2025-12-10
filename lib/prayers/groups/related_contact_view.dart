import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_view.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';
import 'package:prayer_ml/prayers/groups/repos/related_contacts_repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Loader widget that fetches related contact data and displays the view
class RelatedContactViewLoader extends ConsumerWidget {
  const RelatedContactViewLoader({
    super.key,
    required this.relatedContactId,
    required this.groupId,
  });

  final int relatedContactId;
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync =
        ref.watch(fetchRelatedContactWithDataProvider(relatedContactId));

    return switch (dataAsync) {
      AsyncData(:final value) => RelatedContactView(
          data: value,
          groupId: groupId,
        ),
      AsyncError(:final error, :final stackTrace) => Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: PrintError(
            caller: "RelatedContactViewLoader",
            error: error,
            stackTrace: stackTrace,
            onRetry: () => ref.invalidate(
                fetchRelatedContactWithDataProvider(relatedContactId)),
          ),
        ),
      _ => const Scaffold(
          body: CreativeLoadingScreen(),
        ),
    };
  }
}

/// Main view for displaying a related contact with all its information
class RelatedContactView extends ConsumerStatefulWidget {
  const RelatedContactView({
    super.key,
    required this.data,
    required this.groupId,
  });

  final RelatedContactWithData data;
  final int groupId;

  @override
  ConsumerState<RelatedContactView> createState() => _RelatedContactViewState();
}

class _RelatedContactViewState extends ConsumerState<RelatedContactView> {
  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _labelController;
  late TextEditingController _lowLevelRelationshipController;
  String? _selectedHighLevelRelationship;

  final List<String> _relationshipTypes = [
    'family',
    'friend',
    'coworker',
    'neighbor',
    'other',
  ];

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.data.relatedContact.name);
    _labelController =
        TextEditingController(text: widget.data.relatedContact.label ?? '');
    _lowLevelRelationshipController = TextEditingController(
      text: widget.data.relatedContact.lowLevelRelationship ?? '',
    );
    _selectedHighLevelRelationship =
        widget.data.relatedContact.highLevelRelationship;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _labelController.dispose();
    _lowLevelRelationshipController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    final update = RelatedContactUpdate(
      id: widget.data.relatedContact.id,
      name: _nameController.text.isEmpty ? null : _nameController.text,
      label: _labelController.text.isEmpty ? null : _labelController.text,
      lowLevelRelationship: _lowLevelRelationshipController.text.isEmpty
          ? null
          : _lowLevelRelationshipController.text,
      highLevelRelationship: _selectedHighLevelRelationship,
    );

    try {
      await ref
          .read(
              relatedContactsRepoProvider(widget.data.relatedContact.contactId)
                  .notifier)
          .updateRelatedContact(update);

      if (mounted) {
        setState(() => _isEditing = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Changes saved successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving changes: $e')),
        );
      }
    }
  }

  Future<void> _deleteRelatedContact() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Related Contact'),
        content: const Text(
            'Are you sure you want to delete this related contact? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      try {
        await ref
            .read(relatedContactsRepoProvider(
                    widget.data.relatedContact.contactId)
                .notifier)
            .deleteRelatedContact(widget.data.relatedContact.id);

        if (mounted) {
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error deleting: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final relatedContact = widget.data.relatedContact;
    final contact = widget.data.contact;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            actions: [
              if (_isEditing) ...[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() => _isEditing = false);
                    // Reset controllers
                    _nameController.text = relatedContact.name;
                    _labelController.text = relatedContact.label ?? '';
                    _lowLevelRelationshipController.text =
                        relatedContact.lowLevelRelationship ?? '';
                    _selectedHighLevelRelationship =
                        relatedContact.highLevelRelationship;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: _saveChanges,
                ),
              ] else ...[
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => setState(() => _isEditing = true),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: _deleteRelatedContact,
                ),
              ],
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final isExpanded = constraints.maxHeight > kToolbarHeight + 20;

                return FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.only(left: 56, bottom: 16, right: 16),
                  title: Text(
                    relatedContact.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    maxLines: isExpanded ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.purple[700]!, Colors.purple[500]!],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Related Contact Details
                  _RelatedContactDetailsCard(
                    isEditing: _isEditing,
                    nameController: _nameController,
                    labelController: _labelController,
                    lowLevelRelationshipController:
                        _lowLevelRelationshipController,
                    selectedHighLevelRelationship:
                        _selectedHighLevelRelationship,
                    relationshipTypes: _relationshipTypes,
                    onHighLevelRelationshipChanged: (value) {
                      setState(() => _selectedHighLevelRelationship = value);
                    },
                  ),
                  const SizedBox(height: 12),

                  // Link to Main Contact
                  _MainContactLink(
                    contact: contact,
                    groupId: widget.groupId,
                  ),
                  const SizedBox(height: 12),

                  // Prayer Requests (Read-Only Paper Mode)
                  _PrayerRequestsSection(
                    relatedContactId: relatedContact.id,
                    contactId: contact.id,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card displaying and editing related contact details
class _RelatedContactDetailsCard extends StatelessWidget {
  const _RelatedContactDetailsCard({
    required this.isEditing,
    required this.nameController,
    required this.labelController,
    required this.lowLevelRelationshipController,
    required this.selectedHighLevelRelationship,
    required this.relationshipTypes,
    required this.onHighLevelRelationshipChanged,
  });

  final bool isEditing;
  final TextEditingController nameController;
  final TextEditingController labelController;
  final TextEditingController lowLevelRelationshipController;
  final String? selectedHighLevelRelationship;
  final List<String> relationshipTypes;
  final ValueChanged<String?> onHighLevelRelationshipChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline, size: 20, color: Colors.purple[700]),
              const SizedBox(width: 8),
              const Text(
                "Related Contact Details",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Name
          if (isEditing)
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            )
          else
            _DetailRow(
              icon: Icons.badge,
              label: 'Name',
              value: nameController.text,
            ),
          const SizedBox(height: 12),

          // Label
          if (isEditing)
            TextField(
              controller: labelController,
              decoration: const InputDecoration(
                labelText: 'Label (optional)',
                border: OutlineInputBorder(),
                hintText: 'e.g., Primary Contact, Emergency',
              ),
            )
          else if (labelController.text.isNotEmpty)
            _DetailRow(
              icon: Icons.label,
              label: 'Label',
              value: labelController.text,
            ),
          if (!isEditing && labelController.text.isNotEmpty)
            const SizedBox(height: 12),

          // High Level Relationship
          if (isEditing)
            DropdownButtonFormField<String>(
              initialValue:
                  relationshipTypes.contains(selectedHighLevelRelationship)
                      ? selectedHighLevelRelationship
                      : null,
              decoration: const InputDecoration(
                labelText: 'Relationship Type',
                border: OutlineInputBorder(),
              ),
              items: relationshipTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type[0].toUpperCase() + type.substring(1)),
                );
              }).toList(),
              onChanged: onHighLevelRelationshipChanged,
            )
          else if (selectedHighLevelRelationship != null)
            _DetailRow(
              icon: Icons.people,
              label: 'Relationship Type',
              value: selectedHighLevelRelationship![0].toUpperCase() +
                  selectedHighLevelRelationship!.substring(1),
            ),
          if (!isEditing && selectedHighLevelRelationship != null)
            const SizedBox(height: 12),

          // Low Level Relationship
          if (isEditing)
            TextField(
              controller: lowLevelRelationshipController,
              decoration: const InputDecoration(
                labelText: 'Specific Relationship (optional)',
                border: OutlineInputBorder(),
                hintText: 'e.g., mother, brother, best friend',
              ),
            )
          else if (lowLevelRelationshipController.text.isNotEmpty)
            _DetailRow(
              icon: Icons.connect_without_contact,
              label: 'Specific Relationship',
              value: lowLevelRelationshipController.text,
            ),
        ],
      ),
    );
  }
}

/// Simple detail row for displaying information
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Link to open the main contact view
class _MainContactLink extends StatelessWidget {
  const _MainContactLink({
    required this.contact,
    required this.groupId,
  });

  final Contact contact;
  final int groupId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContactView(
              contact: contact,
              groupId: groupId,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.person, color: Colors.blue[700], size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Main Contact: ${contact.name}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Tap to view full profile",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}

/// Section displaying prayer requests for the related contact
class _PrayerRequestsSection extends ConsumerWidget {
  const _PrayerRequestsSection({
    required this.relatedContactId,
    required this.contactId,
  });

  final int relatedContactId;
  final int contactId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.book, size: 20, color: Colors.purple[700]),
                const SizedBox(width: 8),
                const Text(
                  "Prayer Requests",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Prayer Requests List
          PaperMode(
            config: PaperModeConfig.readOnly(
              relatedContactId: relatedContactId,
              maxHeight: 400,
              shrinkWrap: true,
              disablePullToRefresh: true,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
