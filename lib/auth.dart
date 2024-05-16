import 'package:flutter/widgets.dart';
import 'package:g3_app_mobile/models/auth.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

// firebase api key
const apiKey = "AIzaSyDi6K72pVbUc1FGDy1nZ0CeKgYqjDvVAbc";

Future<String> postRegisterUser(
    String email, String password, BuildContext context) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final body = jsonEncode(
      {'email': email, 'password': password, 'returnSecureToken': true});

  var response = await http.post(
    Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey'),
    headers: headers,
    body: body,
  );

  var data = jsonDecode(response.body);

  if (data["error"] != null) {
    return data["error"]["message"];
  }

  Provider.of<AuthModel>(context, listen: false).setAuthenticated(true);
  Provider.of<AuthModel>(context, listen: false).setUid(data["idToken"]);
  Provider.of<AuthModel>(context, listen: false).setEmail(data["email"]);
  return "";
}

Future<String> postLoginUser(
    String email, String password, BuildContext context) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final body = jsonEncode(
      {'email': email, 'password': password, 'returnSecureToken': true});

  var response = await http.post(
    Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey'),
    headers: headers,
    body: body,
  );

  var data = jsonDecode(response.body);

  if (data["error"] != null) {
    return data["error"]["message"];
  }

  Provider.of<AuthModel>(context, listen: false).setAuthenticated(true);
  Provider.of<AuthModel>(context, listen: false).setUid(data["idToken"]);
  Provider.of<AuthModel>(context, listen: false).setEmail(data["email"]);
  return "";
}

void logout(BuildContext context) {
  Provider.of<AuthModel>(context, listen: false).setAuthenticated(false);
  Provider.of<AuthModel>(context, listen: false).setUid(null);
  Provider.of<AuthModel>(context, listen: false).setEmail(null);
}
