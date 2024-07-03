import 'dart:convert';
import 'package:g3_app_mobile/common.dart';
import 'package:g3_app_mobile/constants.dart';
import 'package:http/http.dart' as http;

import 'package:g3_app_mobile/models/auth.model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

Future<String> postRegisterUser(
    String email, String password, BuildContext context) async {
  final headers = buildHeaders(context);
  final body = jsonEncode({"email": email, "password": password});

  var res =
      await http.post(Uri.parse("$apiURL/users"), headers: headers, body: body);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  var data = jsonDecode(res.body);

  Provider.of<AuthModel>(context, listen: false).setIsAuthenticated(true);
  Provider.of<AuthModel>(context, listen: false).setId("${data["id"]}");
  Provider.of<AuthModel>(context, listen: false).setEmail(data["email"]);
  Provider.of<AuthModel>(context, listen: false).setName(data["name"]);
  return "";
}

Future<String> postLoginUser(
    String email, String password, BuildContext context) async {
  final headers = buildHeaders(context);
  final body = jsonEncode({"email": email, "password": password});

  var res =
      await http.post(Uri.parse("$apiURL/auth"), headers: headers, body: body);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  var data = jsonDecode(res.body);

  Provider.of<AuthModel>(context, listen: false).setIsAuthenticated(true);
  Provider.of<AuthModel>(context, listen: false).setId("${data["id"]}");
  Provider.of<AuthModel>(context, listen: false).setEmail(data["email"]);
  Provider.of<AuthModel>(context, listen: false).setName(data["name"]);
  return "";
}

void logout(BuildContext context) {
  Provider.of<AuthModel>(context, listen: false).setIsAuthenticated(false);
  Provider.of<AuthModel>(context, listen: false).setId(null);
  Provider.of<AuthModel>(context, listen: false).setEmail(null);
  Provider.of<AuthModel>(context, listen: false).setName(null);
}
