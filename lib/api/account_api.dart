import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/account_model.dart';
import 'dart:convert';

import 'package:prayer_ml/shared/config.dart';

class AccountApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  AccountApiClient({required this.authClient, required this.baseUrl});

  Future<Account> getAccount() async {
    final response = await authClient.get(config.uri("/account/"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting account: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return Account.fromJson(json);
  }

  Future<Account> updateAccount(AccountUpdateRequest updateRequest) async {
    final response = await authClient.put(
      config.uri("/account/"),
      body: jsonEncode(updateRequest.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error updating account: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return Account.fromJson(json);
  }
}
