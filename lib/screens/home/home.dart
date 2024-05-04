import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/home/last_results.dart';
import 'package:g3_app_mobile/screens/home/last_uploads.dart';
import 'package:g3_app_mobile/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 24),
          color: Colors.deepPurple.shade200,
          child: const Column(
            children: [
              Text(
                "Bienvenido",
                style: headline1,
              ),
              SizedBox(height: 16),
              LastUploads(),
              SizedBox(height: 48),
              LastResults()
            ],
          ),
        ),
      ),
    );
  }
}
