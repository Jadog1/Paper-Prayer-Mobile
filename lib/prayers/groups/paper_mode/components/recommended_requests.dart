import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';
import 'package:prayer_ml/prayers/prayers_shared/prayers_shared_widgets.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Loader widget that fetches and displays recommended prayer requests
class RecommendedPrayerRequestsLoader extends ConsumerWidget {
  const RecommendedPrayerRequestsLoader({super.key, required this.contact});
  
  final Contact contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var recommendedRequests = ref.watch(fetchRecommendationsProvider(contact.id));
    return switch (recommendedRequests) {
      AsyncData(:final value) => RecommendedPrayerRequestsView(collections: value),
      AsyncError(:final error, :final stackTrace) => PrintError(
          caller: "PrayerRequestConsumer",
          error: error,
          stackTrace: stackTrace),
      _ => const CircularProgressIndicator(),
    };
  }
}

/// View widget that displays a list of recommended collections
class RecommendedPrayerRequestsView extends ConsumerWidget {
  const RecommendedPrayerRequestsView({super.key, required this.collections});

  final List<Collection> collections;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text("Recommended follow ups",
            style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: ListView.builder(
            itemCount: collections.length,
            itemBuilder: (context, index) {
              var collection = collections[index];
              return CompactRequestCard(
                title: collection.title,
                description: collection.description,
                relatedContactIds: getRelatedContactIds(collection.relatedContacts),
                allRelatedContacts: const [],
                compactionMode: CompactionMode.withoutRequest,
              );
            },
          ),
        ),
      ],
    );
  }
}
