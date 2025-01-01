import 'package:http/http.dart' as http;
import 'package:prayer_ml/prayers/groups/repos/prayer_api.dart';

class Config {
  String apiUrl = '10.0.2.2:8000';
  late ContactsApiClient contactApiClient;
  late PrayerRequestApiClient prayerRequestApiClient;

  Config() {
    var sharedClient = http.Client();
    contactApiClient = ContactsApiClient(httpClient: sharedClient, baseUrl: apiUrl);
    prayerRequestApiClient = PrayerRequestApiClient(httpClient: sharedClient, baseUrl: apiUrl);
  }

  uri(String endpoint, [Map<String, dynamic>? queryParameters]) {
    var uri = Uri.http(apiUrl, "/api$endpoint", queryParameters);
    return uri;
  }
}

var config = Config();