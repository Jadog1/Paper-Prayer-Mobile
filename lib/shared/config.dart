import 'package:http/http.dart' as http;
import 'package:prayer_ml/api/prayer_api.dart';
import 'package:prayer_ml/api/reminder_api.dart';

class Config {
  String apiUrl = '10.0.0.46:8000';
  late ContactsApiClient contactApiClient;
  late PrayerRequestApiClient prayerRequestApiClient;
  late CollectionsApiClient collectionsApiClient;
  late ReminderApiClient reminderApiClient;

  Config() {
    var sharedClient = http.Client();
    contactApiClient = ContactsApiClient(httpClient: sharedClient, baseUrl: apiUrl);
    prayerRequestApiClient = PrayerRequestApiClient(httpClient: sharedClient, baseUrl: apiUrl);
    collectionsApiClient = CollectionsApiClient(httpClient: sharedClient, baseUrl: apiUrl);
    reminderApiClient = ReminderApiClient(httpClient: sharedClient, baseUrl: apiUrl);
  }

  uri(String endpoint, [Map<String, dynamic>? queryParameters]) {
    var uri = Uri.http(apiUrl, "/api$endpoint", queryParameters);
    return uri;
  }
}

var config = Config();