import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // Modern App Bar with gradient
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final isExpanded = constraints.maxHeight > kToolbarHeight + 20;
                
                return FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 56, bottom: 16, right: 16),
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
                  if (contact.description != null && contact.description!.isNotEmpty)
                    _ContactInfoSection(contact: contact),
                  
                  if (contact.description != null && contact.description!.isNotEmpty)
                    const SizedBox(height: 12),

                  // Upcoming Events Section
                  UpcomingEventsWidget(
                    contactId: contact.id,
                    title: "Upcoming Events",
                    subtitle: "Events for ${contact.name} in the next 30 days",
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
                    height: 500,
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
        ),
      ),
    );
  }
}
