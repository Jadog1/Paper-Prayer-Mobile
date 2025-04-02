import 'package:prayer_ml/api/recommendations_api.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:prayer_ml/api/recommendations_api.dart' show CollectionRecommendationAction;
part 'generated/recommendations_repo.g.dart';

@riverpod
class RecommendationRepo extends _$RecommendationRepo {
  late Config config;

  RecommendationRepo() {
    config = Config();
  }

  @override
  Future<List<Recommendation>> build() async {
    var recommendationsApi = config.recommendationsApiClient;
    return await recommendationsApi.getRecommendations();
  }

  Future<void> updateAction(int collectionId, CollectionRecommendationAction action, String snoozeUntil) async {
    var recommendationsApi = config.recommendationsApiClient;
    await recommendationsApi.updateAction(collectionId, action, snoozeUntil);
    ref.invalidateSelf();
  }
}