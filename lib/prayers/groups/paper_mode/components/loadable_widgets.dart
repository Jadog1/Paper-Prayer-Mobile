import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/pipeline_status_detail.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/pipeline_status_indicator.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/groups/related_contact_view.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Loader widget for Bible verses related to a prayer request
class LoadableBibleVerses extends ConsumerWidget {
  const LoadableBibleVerses({super.key, required this.requestId});

  final int requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var bibleVerses =
        ref.watch(fetchBibleVersesForPrayerRequestProvider(requestId));

    return switch (bibleVerses) {
      AsyncData(:final value) => BibleVerseList(verses: value),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "LoadableBibleVerses",
          error: error,
          stackTrace: stackTrace,
          onRetry: () => ref
              .invalidate(fetchBibleVersesForPrayerRequestProvider(requestId)),
          compact: true),
      _ => const Text("Loading Bible verses..."),
    };
  }
}

/// Displays a list of Bible verses
class BibleVerseList extends StatelessWidget {
  final List<BibleReferenceAndText> verses;

  const BibleVerseList({
    super.key,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    if (verses.isEmpty) {
      return Text(
        "No scripture references found",
        style: TextStyle(
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: verses.map((verse) {
        final ref = verse.modelOutput.reference;
        final referenceLabel =
            "${ref.bookOfTheBible} ${ref.chapter}:${ref.verseStart}${ref.verseEnd != ref.verseStart ? "-${ref.verseEnd}" : ""}";

        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  referenceLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                verse.text,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Loader widget for related contacts
class LoadableRelatedContacts extends ConsumerWidget {
  const LoadableRelatedContacts({
    super.key,
    required this.contactId,
    this.relatedContactIds,
    this.groupId,
  });

  final int contactId;
  final List<int>? relatedContactIds;
  final int? groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (relatedContactIds == null || relatedContactIds!.isEmpty) {
      return Text(
        "No related contacts",
        style: TextStyle(
          color: Colors.grey[600],
          fontStyle: FontStyle.italic,
        ),
      );
    }
    var relatedContacts = ref.watch(fetchRelatedContactsProvider(contactId));
    return switch (relatedContacts) {
      AsyncData(:final value) => _RelatedContactsList(
          contacts: findRelatedContacts(value, relatedContactIds!),
          groupId: groupId,
        ),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "LoadableRelatedContacts",
          error: error,
          stackTrace: stackTrace,
          onRetry: () =>
              ref.invalidate(fetchRelatedContactsProvider(contactId)),
          compact: true),
      _ => const Text("Loading related contacts..."),
    };
  }
}

/// Displays a list of related contacts with chips
class _RelatedContactsList extends StatelessWidget {
  final List<RelatedContact> contacts;
  final int? groupId;

  const _RelatedContactsList({
    required this.contacts,
    this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: contacts.map((contact) {
        return InkWell(
          onTap: groupId != null
              ? () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RelatedContactViewLoader(
                        relatedContactId: contact.id,
                        groupId: groupId!,
                      ),
                    ),
                  );
                }
              : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  size: 16,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 4),
                Text(
                  relatedContactAsString(contact),
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// Loader widget for a collection associated with a request
class LoadableCollection extends ConsumerWidget {
  const LoadableCollection(
      {super.key, required this.requestId, required this.contactId});

  final int contactId;
  final int requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider =
        ref.watch(fetchCollectionFromRequestProvider(requestId, contactId));
    return switch (provider) {
      AsyncData(:final value) => value != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.folder,
                        size: 20, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    const Text(
                      "Collection",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.collection.title ?? "Untitled Collection",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        value.collection.description ?? "",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (value.relatedContacts.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: findRelatedContacts(
                            value.relatedContacts,
                            getRelatedContactIds(
                                value.collection.relatedContacts),
                          ).map((contact) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                contact.name,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[700],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                      const SizedBox(height: 8),
                      CompactRequestButtonGroup(
                        request: value.collection,
                        allRelatedContacts: value.relatedContacts,
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "LoadableCollection",
          error: error,
          stackTrace: stackTrace,
          onRetry: () => ref.invalidate(
              fetchCollectionFromRequestProvider(requestId, contactId)),
          compact: true),
      _ => const Text("Loading collection..."),
    };
  }
}

/// Loader widget for pipeline status
class LoadablePipelineStatus extends ConsumerWidget {
  const LoadablePipelineStatus({
    super.key,
    required this.requestId,
    this.onTap,
  });

  final int requestId;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pipelineStatusAsync =
        ref.watch(fetchPipelineStatusProvider(requestId));

    return pipelineStatusAsync.when(
      data: (pipelineStatus) {
        if (pipelineStatus != null) {
          return PipelineStatusBadge(
            pipelineRun: pipelineStatus,
            onTap: () => showPipelineStatusDetail(context, pipelineStatus),
          );
        }
        // No pipeline found - show friendly message
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No AI processing data',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'This prayer request may have been created before AI processing was enabled.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Loading processing status...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => PrintError(
        caller: "LoadablePipelineStatus",
        error: error,
        stackTrace: stackTrace,
        onRetry: () => ref.invalidate(fetchPipelineStatusProvider(requestId)),
        compact: true,
      ),
    );
  }
}
