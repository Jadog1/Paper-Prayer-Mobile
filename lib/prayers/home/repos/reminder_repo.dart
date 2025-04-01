import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/api/reminder_api.dart';
import 'package:prayer_ml/prayers/home/models/reminder_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:prayer_ml/api/reminder_api.dart' show CollectionRecommendationAction;
part 'generated/reminder_repo.g.dart';

@riverpod
class RecommendationRepo extends _$RecommendationRepo {
  late Config config;

  RecommendationRepo() {
    config = Config();
  }

  @override
  Future<List<Recommendation>> build() async {
    var reminderApi = config.reminderApiClient;
    return await reminderApi.getRecommendations();
  }

  Future<void> updateAction(int collectionId, CollectionRecommendationAction action, String snoozeUntil) async {
    var reminderApi = config.reminderApiClient;
    await reminderApi.updateAction(collectionId, action, snoozeUntil);
    ref.invalidateSelf();
  }
}