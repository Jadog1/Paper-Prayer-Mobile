import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/account_model.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
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

  /// GET /api/account/search?email_query=...&limit=...
  Future<List<AccountSearchResult>> searchAccountsByEmail(
    String emailQuery, {
    int limit = 5,
  }) async {
    if (emailQuery.trim().length < 2) {
      throw Exception('email_query must be at least 2 characters');
    }
    if (limit < 1 || limit > 25) {
      throw Exception('limit must be between 1 and 25');
    }

    final queryParams = {
      'email_query': emailQuery.trim(),
      'limit': limit.toString(),
    };
    final response =
        await authClient.get(config.uri("/account/search", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error searching accounts: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json
        .map((e) => AccountSearchResult.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/account/roles
  Future<List<AssignableRole>> fetchAssignableRoles() async {
    final response = await authClient.get(config.uri("/account/roles"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting assignable roles: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json
        .map((e) => AssignableRole.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/account/roles/group?group_id=...
  Future<List<GroupRoleMember>> fetchGroupRoles(int groupId) async {
    final queryParams = {
      'group_id': groupId.toString(),
    };
    final response =
        await authClient.get(config.uri("/account/roles/group", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting group roles: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json
        .map((e) => GroupRoleMember.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/account/roles/assign
  Future<RoleAssignmentResult> assignRoleToGroup({
    required int groupId,
    required String targetEmail,
    required int role,
  }) async {
    final response = await authClient.post(
      config.uri("/account/roles/assign"),
      body: jsonEncode({
        'group_id': groupId,
        'target_email': targetEmail,
        'role': role,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error assigning role: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return RoleAssignmentResult.fromJson(json as Map<String, dynamic>);
  }

  /// POST /api/account/roles/remove
  Future<RoleRemovalResult> removeRoleFromGroup({
    required int groupId,
    required String targetEmail,
  }) async {
    final response = await authClient.post(
      config.uri("/account/roles/remove"),
      body: jsonEncode({
        'group_id': groupId,
        'target_email': targetEmail,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error removing role: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return RoleRemovalResult.fromJson(json as Map<String, dynamic>);
  }
}
