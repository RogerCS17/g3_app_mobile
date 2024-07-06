import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:g3_app_mobile/common.dart';
import 'package:g3_app_mobile/constants.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:http/http.dart' as http;

Future<String> postScan(String imageData64, BuildContext context) async {
  final headers = buildHeaders(context);
  final body = jsonEncode({"imageData64": imageData64});

  var res =
      await http.post(Uri.parse("$apiURL/scans"), headers: headers, body: body);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  return "${jsonDecode(res.body)["url"]}*${jsonDecode(res.body)["id"]}";
}

Future getScans(BuildContext context, [int? limit]) async {
  final headers = buildHeaders(context);
  var path = "$apiURL/scans";
  if (limit != null) path += "?limit=$limit";
  var res = await http.get(Uri.parse(path), headers: headers);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  Iterable data = jsonDecode(res.body);
  List<Scan?> scans = List<Scan?>.from(data.map((s) => ScanImpl.fromJson(s)));
  return scans;
}
