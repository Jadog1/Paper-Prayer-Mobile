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

  /// GET /api/account/search?code_query=...&limit=...
  Future<List<AccountSearchResult>> searchAccountsByUserCode(
    String codeQuery, {
    int limit = 5,
  }) async {
    if (codeQuery.trim().length < 2) {
      throw Exception('code_query must be at least 2 characters');
    }
    if (limit < 1 || limit > 25) {
      throw Exception('limit must be between 1 and 25');
    }

    final queryParams = {
      'code_query': codeQuery.trim(),
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
    String? targetUserCode,
    String? targetEmail,
    required int role,
  }) async {
    if (targetUserCode == null && targetEmail == null) {
      throw Exception('Either targetUserCode or targetEmail must be provided');
    }
    if (targetUserCode != null && targetEmail != null) {
      throw Exception(
          'Only one of targetUserCode or targetEmail should be provided');
    }

    final body = <String, dynamic>{
      'group_id': groupId,
      'role': role,
    };
    if (targetUserCode != null) {
      body['target_user_code'] = targetUserCode;
    } else {
      body['target_email'] = targetEmail!;
    }

    final response = await authClient.post(
      config.uri("/account/roles/assign"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200 && response.statusCode != 404) {
      throw Exception(
          "Error assigning role: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return RoleAssignmentResult.fromJson(json as Map<String, dynamic>);
  }

  /// POST /api/account/roles/remove
  Future<RoleRemovalResult> removeRoleFromGroup({
    required int groupId,
    String? targetUserCode,
    String? targetEmail,
  }) async {
    if (targetUserCode == null && targetEmail == null) {
      throw Exception('Either targetUserCode or targetEmail must be provided');
    }
    if (targetUserCode != null && targetEmail != null) {
      throw Exception(
          'Only one of targetUserCode or targetEmail should be provided');
    }

    final body = <String, dynamic>{
      'group_id': groupId,
    };
    if (targetUserCode != null) {
      body['target_user_code'] = targetUserCode;
    } else {
      body['target_email'] = targetEmail!;
    }

    final response = await authClient.post(
      config.uri("/account/roles/remove"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error removing role: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return RoleRemovalResult.fromJson(json as Map<String, dynamic>);
  }

  /// GET /api/account/roles/pending?cursor=...&limit=...
  Future<PaginatedPendingInvites> fetchPendingInvites({
    String? cursor,
    required int limit,
  }) async {
    final queryParams = {
      'limit': limit.toString(),
    };
    if (cursor != null) {
      queryParams['cursor'] = cursor;
    }
    final response =
        await authClient.get(config.uri("/account/roles/pending", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error fetching pending invites: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return PaginatedPendingInvites.fromJson(json as Map<String, dynamic>);
  }

  /// POST /api/account/roles/accept
  Future<InviteActionResult> acceptInvite({
    required int groupId,
  }) async {
    final response = await authClient.post(
      config.uri("/account/roles/accept"),
      body: jsonEncode({
        'group_id': groupId,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error accepting invite: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return InviteActionResult.fromJson(json as Map<String, dynamic>);
  }

  /// POST /api/account/roles/reject
  Future<InviteActionResult> rejectInvite({
    required int groupId,
  }) async {
    final response = await authClient.post(
      config.uri("/account/roles/reject"),
      body: jsonEncode({
        'group_id': groupId,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error rejecting invite: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return InviteActionResult.fromJson(json as Map<String, dynamic>);
  }

  /// GET /api/account/notification-preferences
  Future<NotificationPreferences> getNotificationPreferences() async {
    final response =
        await authClient.get(config.uri("/account/notification-preferences"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting notification preferences: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return NotificationPreferences.fromJson(json as Map<String, dynamic>);
  }

  /// PUT /api/account/notification-preferences
  Future<NotificationPreferences> updateNotificationPreferences(
      NotificationPreferences preferences) async {
    final response = await authClient.put(
      config.uri("/account/notification-preferences"),
      body: jsonEncode(preferences.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error updating notification preferences: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return NotificationPreferences.fromJson(json as Map<String, dynamic>);
  }
}
