import 'package:http/http.dart' as http;

class HttpService {
  static final String baseUrl = "http://127.0.0.1:8000/api/kelas/";

  static Future<http.Response> get(String endpoint) {
    var url = Uri.parse(baseUrl + endpoint);
    return http.get(url);
  }

  static Future<http.Response> post(String endpoint, dynamic body) {
    var url = Uri.parse(baseUrl + endpoint);
    return http.post(url, body: body);
  }

  static Future<http.Response> put(String endpoint, dynamic body) {
    var url = Uri.parse(baseUrl + endpoint);
    return http.put(url, body: body);
  }

  static Future<http.Response> delete(String endpoint) {
    var url = Uri.parse(baseUrl + endpoint);
    return http.delete(url);
  }
}
