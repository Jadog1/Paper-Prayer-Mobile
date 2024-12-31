import 'package:http/http.dart' as http;
import 'package:prayer_ml/prayers/groups/repos/contact_api.dart';

class Config {
  String apiUrl = '10.0.2.2:8000';
  late ContactsApiClient contactApiClient;

  Config() {
    contactApiClient = ContactsApiClient(httpClient: http.Client(), baseUrl: apiUrl);
  }

  uri(String endpoint, [Map<String, dynamic>? queryParameters]) {
    var uri = Uri.http(apiUrl, "/api$endpoint", queryParameters);
    return uri;
  }
}

var config = Config();