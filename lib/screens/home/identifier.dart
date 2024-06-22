import 'package:flutter/material.dart';
import 'package:g3_app_mobile/models/auth.model.dart';
import 'package:provider/provider.dart';

class Identifier extends StatelessWidget {
  const Identifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, auth, child) {
        return Text(
          style: const TextStyle(fontSize: 14),
          auth.name ?? auth.email ?? "",
        );
      },
    );
  }
}
