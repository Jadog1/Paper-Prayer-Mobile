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
    var contactApi = config.collectionsApiClient;
    final contacts = await contactApi.fetchCollections(contactId);
    return contacts;
  }

  Future<List<PrayerRequest>> fetchRequests(int contactId) async {
    var contactApi = config.collectionsApiClient;
    return await contactApi.fetchRelatedRequests(contactId);
  }
}

@riverpod
Future<List<Collection>> fetchRecommendations(Ref ref,int contactId) async {
  var config = Config();
  var prayerApi = config.collectionsApiClient;
  return await prayerApi.fetchRecommendations(contactId);
}