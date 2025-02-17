import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
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