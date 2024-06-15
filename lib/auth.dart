import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:g3_app_mobile/models/auth.model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

const apiURL = "http://10.0.2.2:8000";

Map<String, String> buildHeaders() {
  return {
    'Content-Type': 'application/json; charset=UTF-8',
  };
}

Future<String> postRegisterUser(
    String email, String password, BuildContext context) async {
  final headers = buildHeaders();
  final body = jsonEncode({"email": email, "password": password});

  var res =
      await http.post(Uri.parse("$apiURL/users"), headers: headers, body: body);

  var data = jsonDecode(res.body);

  if (data["detail"] != null) {
    return data["detail"][0]["ctx"]["error"];
  }

  Provider.of<AuthModel>(context, listen: false).setAuthenticated(true);
  Provider.of<AuthModel>(context, listen: false).setUid("${data["id"]}");
  Provider.of<AuthModel>(context, listen: false).setEmail(data["email"]);
  return "";
}

Future<String> postLoginUser(
    String email, String password, BuildContext context) async {
  final headers = buildHeaders();
  final body = jsonEncode({"email": email, "password": password});

  var res =
      await http.post(Uri.parse("$apiURL/auth"), headers: headers, body: body);

  var data = jsonDecode(res.body);

  if (data["error"] != null) {
    return data["error"];
  }

  Provider.of<AuthModel>(context, listen: false).setAuthenticated(true);
  Provider.of<AuthModel>(context, listen: false).setUid("${data["id"]}");
  Provider.of<AuthModel>(context, listen: false).setEmail(data["email"]);
  return "";
}

void logout(BuildContext context) {
  Provider.of<AuthModel>(context, listen: false).setAuthenticated(false);
  Provider.of<AuthModel>(context, listen: false).setUid(null);
  Provider.of<AuthModel>(context, listen: false).setEmail(null);
}
