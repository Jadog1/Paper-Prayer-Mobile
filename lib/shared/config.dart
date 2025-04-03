import 'package:http/http.dart' as http;
import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/api/notebook_api.dart';
import 'package:prayer_ml/api/prayer_api.dart';
import 'package:prayer_ml/api/recommendations_api.dart';

class Config {
  String apiUrl = '10.0.2.2:8000'; //10.0.0.46:8000
  late ContactsApiClient contactApiClient;
  late PrayerRequestApiClient prayerRequestApiClient;
  late CollectionsApiClient collectionsApiClient;
  late RecommendationApiClient recommendationsApiClient;
  late NotebookApiClient notebookApiClient;

  Config() {
    var sharedClient = http.Client();
    var authClient = FirebaseAuthHttpClient(httpClient: sharedClient);

    contactApiClient = ContactsApiClient(authClient: authClient, baseUrl: apiUrl);
    prayerRequestApiClient = PrayerRequestApiClient(authClient: authClient, baseUrl: apiUrl);
    collectionsApiClient = CollectionsApiClient(authClient: authClient, baseUrl: apiUrl);
    recommendationsApiClient = RecommendationApiClient(authClient: authClient, baseUrl: apiUrl);
    notebookApiClient = NotebookApiClient(authClient: authClient, baseUrl: apiUrl);
  }

  uri(String endpoint, [Map<String, dynamic>? queryParameters]) {
    var uri = Uri.http(apiUrl, "/api$endpoint", queryParameters);
    return uri;
  }
}

var config = Config();