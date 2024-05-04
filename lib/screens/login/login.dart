import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/login/login_form.dart';
import 'package:g3_app_mobile/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.deepPurple.shade200,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Login", style: headline1), LoginForm()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
