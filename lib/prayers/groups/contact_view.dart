import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_page_settings.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/repos/related_contacts_repo.dart';
import 'package:prayer_ml/prayers/groups/related_contact_view.dart';
import 'package:prayer_ml/prayers/groups/widgets/upcoming_events_widget.dart';
import 'package:prayer_ml/prayers/groups/widgets/prayer_notes_widget.dart';
import 'package:prayer_ml/prayers/home/views/calendar_view.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Contact Dashboard View - displays all information for a specific contact
class ContactView extends ConsumerWidget {
  const ContactView({
    super.key,
    required this.contact,
    required this.groupId,
  });

  final Contact contact;
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupAsync = ref.watch(fetchGroupWithMembersProvider(groupId));

    return groupAsync.when(
      data: (groupWithMembers) => Scaffold(
        backgroundColor: Colors.grey[50],
        body: CustomScrollView(
          slivers: [
            // Modern App Bar with gradient
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final isExpanded =
                      constraints.maxHeight > kToolbarHeight + 20;

                  return FlexibleSpaceBar(
                    titlePadding:
                        const EdgeInsets.only(left: 56, bottom: 16, right: 16),
                    title: Text(
                      contact.name,
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
                          colors: [Colors.green[700]!, Colors.green[500]!],
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
                    // Contact Info Section
                    if (contact.description != null &&
                        contact.description!.isNotEmpty)
                      _ContactInfoSection(contact: contact),

                    if (contact.description != null &&
                        contact.description!.isNotEmpty)
                      const SizedBox(height: 12),

                    // Upcoming Events Section
                    UpcomingEventsWidget(
                      contactId: contact.id,
                      title: "Upcoming Events",
                      subtitle:
                          "Events for ${contact.name} in the next 30 days",
                      onViewAll: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CalendarView(
                              contactId: contact.id,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),

                    // Prayer Notes Section
                    PrayerNotesWidget(
                      groupId: groupId,
                      contactId: contact.id,
                      maxHeight: 500,
                    ),
                    const SizedBox(height: 12),

                    // Related Contacts Section
                    _RelatedContactsSection(
                      contactId: contact.id,
                      groupId: groupId,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ContactPageSettings(
                  contact: contact,
                  group: groupWithMembers.group,
                ),
              ),
            );
          },
          backgroundColor: Colors.green[700],
          foregroundColor: Colors.white,
          tooltip: 'Edit Contact',
          child: const Icon(Icons.edit),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: PrintError(
          caller: "ContactView",
          error: error,
          stackTrace: stack,
          onRetry: () => ref.invalidate(fetchGroupWithMembersProvider(groupId)),
        ),
      ),
    );
  }
}

/// Contact information section
class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection({required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
              Icon(Icons.info_outline, size: 18, color: Colors.green[700]),
              const SizedBox(width: 8),
              const Text(
                "About",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            contact.description ?? "",
            style: const TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

/// Loader widget for ContactView that fetches contact data
class ContactViewLoader extends ConsumerWidget {
  const ContactViewLoader({
    super.key,
    this.contact,
    this.contactId,
    required this.groupId,
  }) : assert(contact != null || contactId != null,
            'Either contact or contactId must be provided');

  final Contact? contact;
  final int? contactId;
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (contact != null) {
      return ContactView(contact: contact!, groupId: groupId);
    }

    // Fetch contact by ID
    final contactsAsync = ref.watch(fetchRelatedContactsProvider(contactId!));

    return contactsAsync.when(
      data: (contacts) {
        // Find the main contact from the list
        final mainContact = contacts.firstWhere(
          (c) => c.contactId == contactId,
          orElse: () => contacts.first,
        );

        // Convert RelatedContact to Contact
        final contact = Contact(
          id: mainContact.contactId,
          name: mainContact.name,
          accountId: mainContact.accountId,
          description: null,
          createdAt: mainContact.createdAt,
        );

        return ContactView(contact: contact, groupId: groupId);
      },
      loading: () => const Scaffold(
        body: CreativeLoadingScreen(),
      ),
      error: (error, stack) => Scaffold(
        body: PrintError(
          caller: "ContactViewLoader",
          error: error,
          stackTrace: stack,
          onRetry: () =>
              ref.invalidate(fetchRelatedContactsProvider(contactId!)),
        ),
      ),
    );
  }
}

/// Section displaying related contacts with merge functionality
class _RelatedContactsSection extends ConsumerWidget {
  const _RelatedContactsSection({
    required this.contactId,
    required this.groupId,
  });

  final int contactId;
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedContactsAsync =
        ref.watch(fetchRelatedContactsForContactProvider(contactId));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                Icon(Icons.people_outline, size: 20, color: Colors.purple[700]),
                const SizedBox(width: 8),
                const Text(
                  "Related Contacts",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // Related Contacts List
          relatedContactsAsync.when(
            data: (relatedContacts) {
              if (relatedContacts.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No related contacts found',
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: relatedContacts.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final relatedContact = relatedContacts[index];
                  return _RelatedContactCard(
                    relatedContact: relatedContact,
                    groupId: groupId,
                    allRelatedContacts: relatedContacts,
                    onMerge: () => ref.invalidate(
                        fetchRelatedContactsForContactProvider(contactId)),
                  );
                },
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Error loading related contacts: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// Card for a single related contact
class _RelatedContactCard extends ConsumerWidget {
  const _RelatedContactCard({
    required this.relatedContact,
    required this.groupId,
    required this.allRelatedContacts,
    required this.onMerge,
  });

  final RelatedContact relatedContact;
  final int groupId;
  final List<RelatedContact> allRelatedContacts;
  final VoidCallback onMerge;

  Future<void> _showMergeDialog(BuildContext context, WidgetRef ref) async {
    RelatedContact? selectedTarget;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Merge Related Contacts'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Merge "${relatedContact.name}" into:'),
              const SizedBox(height: 16),
              DropdownButton<RelatedContact>(
                value: selectedTarget,
                hint: const Text('Select target contact'),
                isExpanded: true,
                items: allRelatedContacts
                    .where((rc) => rc.id != relatedContact.id)
                    .map((rc) => DropdownMenuItem(
                          value: rc,
                          child: Text(rc.name),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedTarget = value);
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'This will move all prayer requests from the source to the target contact. This action cannot be undone.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: selectedTarget == null
                  ? null
                  : () => Navigator.of(context).pop(true),
              child: const Text('Merge'),
            ),
          ],
        ),
      ),
    );

    if (confirmed == true && selectedTarget != null) {
      try {
        await ref
            .read(
                relatedContactsRepoProvider(relatedContact.contactId).notifier)
            .mergeRelatedContacts(relatedContact.id, selectedTarget!.id);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contacts merged successfully')),
          );
          onMerge();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error merging contacts: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayName = relatedContact.name;
    final relationship = relatedContact.highLevelRelationship ??
        relatedContact.lowLevelRelationship ??
        'Related Contact';
    final label = relatedContact.label;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RelatedContactViewLoader(
              relatedContactId: relatedContact.id,
              groupId: groupId,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(Icons.person_outline,
                  color: Colors.purple[700], size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        relationship,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      if (label != null && label.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.purple[900],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            // Merge button
            IconButton(
              icon: const Icon(Icons.merge_type),
              iconSize: 20,
              tooltip: 'Merge with another contact',
              onPressed: () => _showMergeDialog(context, ref),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
          ],
        ),
      ),
    );
  }
}
