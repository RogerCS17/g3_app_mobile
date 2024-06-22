import 'package:flutter/widgets.dart';
import 'package:g3_app_mobile/models/auth.model.dart';
import 'package:provider/provider.dart';

Map<String, String> buildHeaders(BuildContext context) {
  return {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': Provider.of<AuthModel>(context, listen: false).id ?? "",
  };
}
