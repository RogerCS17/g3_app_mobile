import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:g3_app_mobile/common.dart';
import 'package:g3_app_mobile/constants.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:http/http.dart' as http;

Future<String> postResult(
    String scanUrl, String scanId, bool hasCancer, BuildContext context) async {
  final headers = buildHeaders(context);
  final body = jsonEncode(
      {"scanUrl": scanUrl, "scanId": scanId, "hasCancer": hasCancer});

  var res = await http.post(Uri.parse("$apiURL/results"),
      headers: headers, body: body);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  return "";
}

Future getResults(BuildContext context, [int? limit]) async {
  final headers = buildHeaders(context);
  var path = "$apiURL/results";
  if (limit != null) path += "?limit=$limit";
  var res = await http.get(Uri.parse(path), headers: headers);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  Iterable data = jsonDecode(res.body);
  List<Result?> results =
      List<Result?>.from(data.map((s) => ResultImpl.fromJson(s)));
  return results;
}
