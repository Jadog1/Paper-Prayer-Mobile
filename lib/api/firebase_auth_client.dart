import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


var currentUser = FirebaseAuth.instance.currentUser;
// Design an http client that supports get, post, delete, put.
// It is being wrapped to add authentication headers.
class FirebaseAuthHttpClient {
  final http.Client httpClient;

  FirebaseAuthHttpClient({required this.httpClient});

  Future<http.Response> get(Uri uri, {Map<String, String>? headers}) async {
    if (currentUser == null) {
      throw Exception('User is not authenticated');
    }
    headers ??= {};
    var token = await currentUser?.getIdToken();
    headers['Authorization'] = 'Bearer $token';
    return httpClient.get(uri, headers: headers);
  }

  Future<http.Response> post(Uri uri, {Map<String, String>? headers, Object? body}) async {
    if (currentUser == null) {
      throw Exception('User is not authenticated');
    }
    headers ??= {};
    var token = await currentUser?.getIdToken();
    headers['Authorization'] = 'Bearer $token';
    return httpClient.post(uri, headers: headers, body: body);
  }

  Future<http.Response> delete(Uri uri, {Map<String, String>? headers, Object? body}) async {
    if (currentUser == null) {
      throw Exception('User is not authenticated');
    }
    headers ??= {};
    var token = await currentUser?.getIdToken();
    headers['Authorization'] = 'Bearer $token';
    return httpClient.delete(uri, headers: headers, body: body);
  }

  Future<http.Response> put(Uri uri, {Map<String, String>? headers, Object? body}) async {
    if (currentUser == null) {
      throw Exception('User is not authenticated');
    }
    headers ??= {};
    var token = await currentUser?.getIdToken();
    headers['Authorization'] = 'Bearer $token';
    return httpClient.put(uri, headers: headers, body: body);
  }
}