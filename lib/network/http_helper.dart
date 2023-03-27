import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'backend_config.dart';

class HttpHelper {
  static Future<dynamic> loginUser(
      {required String email, required String password}) async {
    try {
      var response = await http.post(
          Uri.http('${IP_ADDRESS}:$IP_PORT', LOGIN_ROUTE),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return {'refresh': body['refresh'], 'access': body['access']};
      } else if (response.statusCode == 400) {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getAccessLogInfo() async {
    // Map<String, String> headers = new Map({'l', 'l'})
    var headers = {
      HttpHeaders.authorizationHeader:
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc5MjA4MTgyLCJpYXQiOjE2NzgzNDQxODIsImp0aSI6IjE5ZDA3NzJhYjQxZjQyNGY5ZTU3ZjE2NDZjY2U0MTY5IiwidXNlcl9pZCI6ImNiMWJlOGY0LTdhNDQtNGYzZi05MTk5LWEzMjgyOGM5NTUyYyJ9.wdP51pEfaBXwWEhBBE1tvhJm0tUczSF5xGErBkq52oc',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    var response = await http.get(
      Uri.http('${IP_ADDRESS}:$IP_PORT', ACCESS_LOG_ROUTE),
      headers: headers,
    );
    return response;
  }
}
