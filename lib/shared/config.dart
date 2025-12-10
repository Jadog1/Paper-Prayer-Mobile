import 'package:http/http.dart' as http;
import 'package:prayer_ml/api/account_api.dart';
import 'package:prayer_ml/api/events_api.dart';
import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/api/mobile_auth_api.dart';
import 'package:prayer_ml/api/notebook_api.dart';
import 'package:prayer_ml/api/prayer_api.dart';
import 'package:prayer_ml/api/recommendations_api.dart';
import 'package:prayer_ml/api/related_contacts_api.dart';
import 'package:prayer_ml/api/usage_api.dart';

const backendUrl =
    String.fromEnvironment('backend_url', defaultValue: '10.0.0.46:8000');
const websiteUrl = String.fromEnvironment('website_url',
    defaultValue: 'http://localhost:5173/');

class Config {
  // prod: https://paper-prayer-af73d35b1629.herokuapp.com/
  String apiUrl =
      backendUrl; // From phone: 10.0.0.46:8000 -- Emulator: 10.0.2.2:8000
  late ContactsApiClient contactApiClient;
  late PrayerRequestApiClient prayerRequestApiClient;
  late CollectionsApiClient collectionsApiClient;
  late RecommendationApiClient recommendationsApiClient;
  late NotebookApiClient notebookApiClient;
  late AccountApiClient accountApiClient;
  late EventsApiClient eventsApiClient;
  late RelatedContactsApiClient relatedContactsApiClient;
  late MobileAuthApiClient mobileAuthApiClient;
  late UsageApiClient usageApiClient;

  Config() {
    var sharedClient = http.Client();
    var authClient = FirebaseAuthHttpClient(httpClient: sharedClient);

    contactApiClient =
        ContactsApiClient(authClient: authClient, baseUrl: apiUrl);
    prayerRequestApiClient =
        PrayerRequestApiClient(authClient: authClient, baseUrl: apiUrl);
    collectionsApiClient =
        CollectionsApiClient(authClient: authClient, baseUrl: apiUrl);
    recommendationsApiClient =
        RecommendationApiClient(authClient: authClient, baseUrl: apiUrl);
    notebookApiClient =
        NotebookApiClient(authClient: authClient, baseUrl: apiUrl);
    accountApiClient =
        AccountApiClient(authClient: authClient, baseUrl: apiUrl);
    eventsApiClient = EventsApiClient(authClient: authClient, baseUrl: apiUrl);
    relatedContactsApiClient =
        RelatedContactsApiClient(authClient: authClient, baseUrl: apiUrl);
    mobileAuthApiClient =
        MobileAuthApiClient(httpClient: sharedClient, baseUrl: apiUrl);
    usageApiClient = UsageApiClient(authClient: authClient, baseUrl: apiUrl);
  }

  uri(String endpoint, [Map<String, dynamic>? queryParameters]) {
    var uri = Uri.http(apiUrl, "/api$endpoint", queryParameters);
    return uri;
  }
}

var config = Config();
