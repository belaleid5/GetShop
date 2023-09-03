import 'dart:convert';
import 'package:http/http.dart' as http;



class HttpHelperPayment {
  static late http.Client client;
  static void init() {
    client = http.Client();
  }
  // to get data from URL
  static Future<http.Response> getData({required String url, Map<String, dynamic>? query})
  async {
    final response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    return response;
  }

  // post data
  static Future<http.Response> postData({
    required String url,
    required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: data != null ? jsonEncode(data) : null);

    return response;
  }
}


