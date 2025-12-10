import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/usage/models/usage_cost_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/usage_repo.g.dart';

/// Fetch usage cost summary for a specific date range
@riverpod
Future<UsageCostSummary> fetchUsageCost(
  Ref ref, {
  required String startDate,
  required String endDate,
}) async {
  var config = Config();
  var api = config.usageApiClient;
  return await api.getUsageCost(
    startDate: startDate,
    endDate: endDate,
  );
}
