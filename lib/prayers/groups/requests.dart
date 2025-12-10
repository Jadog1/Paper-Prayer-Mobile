import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/prayers/groups/contact_view.dart';
import 'package:prayer_ml/prayers/groups/related_contact_view.dart';
import 'package:prayer_ml/prayers/groups/widgets/quick_info_bar.dart';
import 'package:prayer_ml/prayers/groups/widgets/upcoming_events_widget.dart';
import 'package:prayer_ml/prayers/groups/widgets/prayer_notes_widget.dart';
import 'package:prayer_ml/prayers/home/views/calendar_view.dart';
import 'package:prayer_ml/shared/widgets.dart';

class PrayerRequestWithAll {
  final Collection collection;
  final List<RelatedContact> relatedContacts;

  PrayerRequestWithAll(
      {required this.collection, required this.relatedContacts});
}

class CompactRequestButtonGroup extends ConsumerWidget {
  const CompactRequestButtonGroup(
      {super.key, required this.request, required this.allRelatedContacts});

  final Collection request;
  final List<RelatedContact> allRelatedContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prayerWithAll = PrayerRequestWithAll(
        collection: request, relatedContacts: allRelatedContacts);
    return SizedBox(
      height: 26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 25,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            style: const ButtonStyle(
              tapTargetSize:
                  MaterialTapTargetSize.shrinkWrap, // the '2023' part
            ),
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.dashboard_customize),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      RequestDashboard(prayerWithAll: prayerWithAll)),
            ),
          ),
          const Spacer(),
          DeleteConfirmationButton(
            onDelete: () => ref
                .read(collectionContactRepoProvider(request.user.id).notifier)
                .remove(request),
            onCancel: () => {},
            deleteContext: "prayer request",
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class RequestDashboardLoader extends ConsumerWidget {
  const RequestDashboardLoader({
    super.key,
    this.collection,
    this.collectionId,
    this.userId,
    this.relatedContacts,
  }) : assert(
            (collection != null && relatedContacts != null) ||
                (collectionId != null && userId != null) ||
                collection != null,
            'Either (collection and relatedContacts), collectionId and userId, or just collection must be provided');

  final Collection? collection;
  final int? collectionId;
  final int? userId;
  final List<RelatedContact>? relatedContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (collection != null && relatedContacts != null) {
      return RequestDashboard(
          prayerWithAll: PrayerRequestWithAll(
              collection: collection!, relatedContacts: relatedContacts!));
    } else if (collection != null) {
      var viewModel =
          ref.watch(fetchRelatedContactsProvider(collection!.user.id));
      return switch (viewModel) {
        AsyncData(:final value) => RequestDashboard(
            prayerWithAll: PrayerRequestWithAll(
                collection: collection!, relatedContacts: value)),
        AsyncError(:final error, :final stackTrace) => PrintError(
            caller: "RequestDashboardLoader",
            error: error,
            stackTrace: stackTrace,
            onRetry: () => ref
                .invalidate(fetchRelatedContactsProvider(collection!.user.id))),
        _ => const CreativeLoadingScreen(),
      };
    } else {
      var provider = ref
          .watch(fetchCollectionWithContactsProvider(collectionId!, userId!));
      return switch (provider) {
        AsyncData(:final value) => RequestDashboard(
            prayerWithAll: PrayerRequestWithAll(
                collection: value.collection,
                relatedContacts: value.relatedContacts)),
        AsyncError(:final error, :final stackTrace) => PrintError(
            caller: "RequestDashboardLoader",
            error: error,
            stackTrace: stackTrace,
            onRetry: () => ref.invalidate(
                fetchCollectionWithContactsProvider(collectionId!, userId!))),
        _ => const CreativeLoadingScreen(),
      };
    }
  }
}

class RequestDashboard extends ConsumerWidget {
  const RequestDashboard({super.key, required this.prayerWithAll});

  final PrayerRequestWithAll prayerWithAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var collection = prayerWithAll.collection;
    var relatedContacts = findRelatedContacts(prayerWithAll.relatedContacts,
        getRelatedContactIds(collection.relatedContacts));

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
                // Check if app bar is expanded or collapsed
                final isExpanded = constraints.maxHeight > kToolbarHeight + 20;

                return FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.only(left: 56, bottom: 16, right: 16),
                  title: Text(
                    collection.title ?? "Prayer Request",
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
                        colors: [Colors.blue[700]!, Colors.blue[500]!],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Quick Info Bar
                QuickInfoBar(
                  createdAt: collection.createdAt,
                  startDate: collection.startRangeOfEventDate,
                  expirationDate: collection.relevancyExpirationDate,
                ),

                // Main Content Grid
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Details Section
                      _DetailsSection(
                        collection: collection,
                        relatedContacts: relatedContacts,
                      ),
                      const SizedBox(height: 12),

                      // Contact View Link
                      _ContactViewLink(
                          contact: collection.user,
                          groupId: collection.group.groupId),
                      const SizedBox(height: 12),

                      // Upcoming Events Section
                      UpcomingEventsWidget(
                        collectionId: collection.id,
                        title: "Upcoming Events",
                        subtitle:
                            "Events for this collection in the next 30 days",
                        onViewAll: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CalendarView(
                                collectionId: collection.id,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),

                      // Prayer Notes Section
                      PrayerNotesWidget(
                        groupId: collection.group.groupId,
                        collectionId: collection.id,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Link to open full contact view
class _ContactViewLink extends StatelessWidget {
  const _ContactViewLink({
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
          border: Border.all(color: Colors.green[200]!),
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
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.person, color: Colors.green[700], size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "View ${contact.name}'s Profile",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "See all events and prayer notes",
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

/// Details section with description and metadata
class _DetailsSection extends StatelessWidget {
  const _DetailsSection({
    required this.collection,
    required this.relatedContacts,
  });

  final Collection collection;
  final List<RelatedContact> relatedContacts;

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
          // Description
          if ((collection.description ?? "").isNotEmpty) ...[
            Text(
              collection.description!,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Related Contacts
          if (relatedContacts.isNotEmpty) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.people, size: 18, color: Colors.blue[700]),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: relatedContacts.map((rc) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RelatedContactViewLoader(
                                relatedContactId: rc.id,
                                groupId: collection.group.groupId,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.blue[200]!),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person,
                                  size: 14, color: Colors.blue[700]),
                              const SizedBox(width: 4),
                              Text(
                                _formatRelatedContact(rc),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          // Follow Up Priority
          Row(
            children: [
              Icon(Icons.flag, size: 18, color: Colors.amber[700]),
              const SizedBox(width: 8),
              Text(
                "Priority: ${collection.followUpRankLabel}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatRelatedContact(RelatedContact rc) {
    String name = rc.name;
    if (name.isEmpty &&
        rc.lowLevelRelationship != null &&
        rc.lowLevelRelationship!.isNotEmpty) {
      name = rc.lowLevelRelationship!;
    }

    if (rc.highLevelRelationship != null &&
        rc.highLevelRelationship!.isNotEmpty &&
        rc.highLevelRelationship != 'other') {
      name = "$name (${rc.highLevelRelationship!})";
    }

    if (rc.label != null && rc.label!.isNotEmpty) {
      name = "$name [${rc.label}]";
    }

    return name.trim();
  }
}
