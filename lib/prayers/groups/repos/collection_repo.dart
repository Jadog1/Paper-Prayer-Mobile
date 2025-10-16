import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/home/repos/events_repo.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/collection_repo.g.dart';

@riverpod
class CollectionContactRepo extends _$CollectionContactRepo {
  late Config config;

  CollectionContactRepo() {
    config = Config();
  }

  @override
  Future<List<Collection>> build(int contactId) async {
    var api = config.collectionsApiClient;
    final contacts = await api.fetchCollections(contactId);
    return contacts;
  }

  Future<void> remove(Collection collection) async {
    var api = config.collectionsApiClient;
    await api.removeCollection(collection.id);

    ref.invalidateSelf();
  }
}

@riverpod
Future<List<Collection>> fetchRecommendations(Ref ref,int contactId) async {
  var config = Config();
  var api = config.collectionsApiClient;
  return await api.fetchRecommendations(contactId);
}

@riverpod
Future<List<PrayerRequest>> fetchRequestsInCollection(Ref ref, int collectionId) async {
  var api = config.collectionsApiClient;
  return await api.fetchRelatedRequests(collectionId);
}

class CollectionAndRelatedContacts {
  Collection collection;
  List<RelatedContact> relatedContacts;

  CollectionAndRelatedContacts({required this.collection, required this.relatedContacts});
}
@riverpod
Future<CollectionAndRelatedContacts?> fetchCollectionFromRequest(Ref ref, int requestId, int contactId) async {
  var api = config.collectionsApiClient;
  var collection = await api.fetchCollectionFromRequest(requestId);
  if (collection == null) {
    return null;
  }
  var relatedContacts = await config.contactApiClient.fetchRelatedContacts(contactId);
  return CollectionAndRelatedContacts(collection: collection, relatedContacts: relatedContacts);
}
@riverpod
Future<CollectionAndRelatedContacts> fetchCollectionWithContacts(Ref ref, int collectionId, int contactId) async {
  var api = config.collectionsApiClient;
  var collection = await api.fetch(collectionId);
  var relatedContacts = await config.contactApiClient.fetchRelatedContacts(contactId);
  return CollectionAndRelatedContacts(collection: collection, relatedContacts: relatedContacts);
}

@riverpod
Future<Collection> fetchCollectionForEvent(Ref ref, int eventId) async {
  var api = config.eventsApiClient;
  return await api.getCollectionForEvent(eventId);
}

@riverpod
Future<void> deleteEvent(Ref ref, int eventId) async {
  var api = config.eventsApiClient;
  await api.deleteEvent(eventId);
  
  // Invalidate all event-related caches so the UI refreshes
  ref.invalidate(fetchEventsInRangeProvider);
  ref.invalidate(fetchFutureEventsProvider);
  ref.invalidate(paginatedEventsNotifierProvider);
}