import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
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
    (collection != null && relatedContacts != null) || (collectionId != null && userId != null) || collection != null,
    'Either (collection and relatedContacts), collectionId and userId, or just collection must be provided'
  );

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
      var viewModel = ref.watch(fetchRelatedContactsProvider(collection!.user.id));
      return switch (viewModel) {
        AsyncData(:final value) => RequestDashboard(
            prayerWithAll: PrayerRequestWithAll(
                collection: collection!, relatedContacts: value)),
        AsyncError(:final error, :final stackTrace) => PrintError(
            caller: "RequestDashboardLoader",
            error: error,
            stackTrace: stackTrace),
        _ => const CreativeLoadingScreen(),
      };
    } else {
      var provider = ref.watch(fetchCollectionWithContactsProvider(collectionId!, userId!));
      return switch (provider) {
        AsyncData(:final value) => RequestDashboard(
            prayerWithAll: PrayerRequestWithAll(
                collection: value.collection, relatedContacts: value.relatedContacts)),
        AsyncError(:final error, :final stackTrace) => PrintError(
            caller: "RequestDashboardLoader",
            error: error,
            stackTrace: stackTrace),
        _ => const CreativeLoadingScreen(),
      };
    }
  }
}

class RequestDashboard extends StatelessWidget {
  const RequestDashboard({super.key, required this.prayerWithAll});

  final PrayerRequestWithAll prayerWithAll;

  @override
  Widget build(BuildContext context) {
    var collection = prayerWithAll.collection;
    var format = DateFormat('yMd');
    var relevancyExpirationDate = collection.relevancyExpirationDate != null
        ? format.format(collection.relevancyExpirationDate!.toLocal())
        : "N/A";
    var startRangeOfEventDate = collection.startRangeOfEventDate != null
        ? format.format(collection.startRangeOfEventDate!.toLocal())
        : "N/A";
    var endRangeOfEventDate = collection.endRangeOfEventDate != null
        ? format.format(collection.endRangeOfEventDate!.toLocal())
        : "N/A";

    var relatedContacts = findRelatedContacts(prayerWithAll.relatedContacts,
        getRelatedContactIds(collection.relatedContacts));
    return Column(
      children: <Widget>[
        AppBar(title: const Text("Collection Overview")),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                collectionDetails(
                  context,
                  collection,
                  relatedContacts,
                  relevancyExpirationDate,
                  startRangeOfEventDate,
                  endRangeOfEventDate,
                ),
                const Divider(height: 16, thickness: 3),
                Expanded(
                  child: PaperMode(
                    config: PaperModeConfig.editable(
                      groupId: prayerWithAll.collection.group.groupId,
                      collectionId: collection.id,
                      showHeader: false,
                      skipKeyboardFocusOnLoad: true,
                      noPadding: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column collectionDetails(
      BuildContext context,
      Collection collection,
      List<RelatedContact> relatedContacts,
      String relevancyExpirationDate,
      String startRangeOfEventDate,
      String endRangeOfEventDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Created At
        Row(
          children: [
            Expanded(
              child: Text(
                collection.title ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // Remove overflow and maxLines to allow wrapping
              ),
            ),
            const SizedBox(width: 8),
            IntrinsicWidth(
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 2),
                  Text(
                    dateTimeToDate(collection.createdAt),
                    style: TextStyle(color: Colors.grey[700], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(height: 16, thickness: 1),
        // Description
        if ((collection.description ?? "").isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              collection.description ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        // Related Contacts
        Row(
          children: [
            Icon(Icons.people, size: 16, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                relatedContactsAsString(relatedContacts),
                style: const TextStyle(fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const Divider(height: 16, thickness: 1),
        // Follow Up Rank & Sentiment
        Row(
          children: [
            Icon(Icons.star, size: 16, color: Colors.amber[700]),
            const SizedBox(width: 2),
            Text(collection.followUpRankLabel,
                style: const TextStyle(fontSize: 13)),
          ],
        ),
        const Divider(height: 16, thickness: 1),
        // Dates (compact)
        Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: 'The date after which this request is no longer considered relevant.',
              child: Icon(Icons.event_busy, size: 16, color: Colors.red[300]),
            ),
            Text(relevancyExpirationDate, style: const TextStyle(fontSize: 12)),
            Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: 'The earliest possible date for the event.',
              child: Icon(Icons.event, size: 16, color: Colors.blue[300]),
            ),
            Text(startRangeOfEventDate, style: const TextStyle(fontSize: 12)),
            Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              message: 'The latest possible date for the event.',
              child: Icon(Icons.event, size: 16, color: Colors.green[300]),
            ),
            Text(endRangeOfEventDate, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ],
    );
  }
}
