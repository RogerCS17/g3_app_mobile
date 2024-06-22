import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:g3_app_mobile/common.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:http/http.dart' as http;

const apiURL = "http://10.0.2.2:3000";

Future<String> postScan(String imageData64, BuildContext context) async {
  final headers = buildHeaders(context);
  final body = jsonEncode({"imageData64": imageData64});

  var res =
      await http.post(Uri.parse("$apiURL/scans"), headers: headers, body: body);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  return "";
}

Future getScans(BuildContext context) async {
  final headers = buildHeaders(context);
  var res = await http.get(Uri.parse("$apiURL/scans"), headers: headers);
  if (res.statusCode > 399) return jsonDecode(res.body)["message"];

  Iterable data = jsonDecode(res.body);
  List<Scan?> scans = List<Scan?>.from(data.map((s) => ScanImpl.fromJson(s)));
  return scans;
}
