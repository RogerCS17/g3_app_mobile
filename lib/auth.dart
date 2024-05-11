import 'package:http/http.dart' as http;
import 'dart:convert';

// firebase api key
const apiKey = "AIzaSyDi6K72pVbUc1FGDy1nZ0CeKgYqjDvVAbc";

Future<http.Response> postRegisterUser(String email, String password) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final body = jsonEncode(
      {'email': email, 'password': password, 'returnSecureToken': true});

  return http.post(
    Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey'),
    headers: headers,
    body: body,
  );
}

Future<http.Response> postLoginUser(String email, String password) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final body = jsonEncode(
      {'email': email, 'password': password, 'returnSecureToken': true});

  return http.post(
    Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey'),
    headers: headers,
    body: body,
  );
}
