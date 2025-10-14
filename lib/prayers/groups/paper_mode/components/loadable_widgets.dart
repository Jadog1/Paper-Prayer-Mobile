import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/prayers/prayers_shared/prayers_shared_widgets.dart';
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
          stackTrace: stackTrace),
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
    // Limit to the first couple of verses
    final displayedVerses = verses.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: displayedVerses.map((verse) {
        final ref = verse.modelOutput.reference;
        final referenceLabel =
            "${ref.bookOfTheBible} ${ref.chapter}:${ref.verseStart}${ref.verseEnd != ref.verseStart ? "-${ref.verseEnd}" : ""}";

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$referenceLabel ",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Expanded(
                child: Text(
                  verse.text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,
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
  const LoadableRelatedContacts(
      {super.key, required this.contactId, this.relatedContactIds});

  final int contactId;
  final List<int>? relatedContactIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (relatedContactIds == null || relatedContactIds!.isEmpty) {
      return const Text("No related contacts");
    }
    var relatedContacts = ref.watch(fetchRelatedContactsProvider(contactId));
    return switch (relatedContacts) {
      AsyncData(:final value) => Text(relatedContactsAsString(
          findRelatedContacts(value, relatedContactIds!))),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "LoadableRelatedContacts",
          error: error,
          stackTrace: stackTrace),
      _ => const Text("Loading related contacts..."),
    };
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
          ? CompactRequestCard(
              title: value.collection.title,
              description: value.collection.description,
              relatedContactIds:
                  getRelatedContactIds(value.collection.relatedContacts),
              allRelatedContacts: value.relatedContacts,
              child: CompactRequestButtonGroup(
                  request: value.collection,
                  allRelatedContacts: value.relatedContacts),
            )
          : const Text("No collection"),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "LoadableCollection", error: error, stackTrace: stackTrace),
      _ => const Text("Loading collection..."),
    };
  }
}
