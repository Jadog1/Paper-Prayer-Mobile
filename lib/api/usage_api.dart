import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/usage/models/usage_cost_model.dart';
import 'dart:convert';

import 'package:prayer_ml/shared/config.dart';

class UsageApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  UsageApiClient({required this.authClient, required this.baseUrl});

  /// Get usage cost summary for a date range
  /// Endpoint: GET /account/usage-cost?start_date=2025-11-01T00:00:00Z&end_date=2025-12-01T00:00:00Z
  Future<UsageCostSummary> getUsageCost({
    required String startDate,
    required String endDate,
  }) async {
    final queryParams = {
      'start_date': startDate,
      'end_date': endDate,
    };

    final response = await authClient.get(
      config.uri("/account/usage-cost", queryParams),
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting usage cost: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return UsageCostSummary.fromJson(json);
  }
}
