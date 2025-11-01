import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/api/mobile_auth_api.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/mobile_auth_repo.g.dart';

/// Get a mobile session ID by exchanging the current user's Firebase token
@riverpod
Future<MobileAuthSession> exchangeFirebaseToken(Ref ref) async {
  final mobileAuthApi = config.mobileAuthApiClient;
  
  // Get the Firebase ID token
  final firebaseToken = await mobileAuthApi.getFirebaseIdToken();
  
  // Exchange it for a session ID
  final session = await mobileAuthApi.exchangeToken(firebaseToken);
  
  return session;
}
