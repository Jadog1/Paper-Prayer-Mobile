import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayer_ml/shared/config.dart';

class MobileAuthApiClient {
  final http.Client httpClient;
  final String baseUrl;

  MobileAuthApiClient({required this.httpClient, required this.baseUrl});

  /// Exchange Firebase ID token for a mobile session ID
  /// Endpoint: POST /mobile-auth/exchange
  Future<MobileAuthSession> exchangeToken(String firebaseToken) async {
    final response = await httpClient.post(
      config.uri("/mobile-auth/exchange"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'firebase_token': firebaseToken,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Failed to exchange token: ${response.statusCode} - ${response.body}');
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return MobileAuthSession.fromJson(json);
  }

  /// Get Firebase ID token from current user
  Future<String> getFirebaseIdToken() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception('User not authenticated. Please sign in first.');
    }

    final idToken = await user.getIdToken();

    if (idToken == null) {
      throw Exception('Failed to get ID token from Firebase user.');
    }

    return idToken;
  }
}

/// Model for mobile auth session response
class MobileAuthSession {
  final String sessionId;
  final int expiresIn;

  MobileAuthSession({
    required this.sessionId,
    required this.expiresIn,
  });

  factory MobileAuthSession.fromJson(Map<String, dynamic> json) {
    return MobileAuthSession(
      sessionId: json['session_id'] as String,
      expiresIn: json['expires_in'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'expires_in': expiresIn,
    };
  }
}
