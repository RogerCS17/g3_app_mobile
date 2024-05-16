import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/sign_up/sign_up_form.dart';
import 'package:g3_app_mobile/styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 200),
          color: Colors.deepPurple.shade200,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Registrate", style: headline1),
                  SizedBox(
                    height: 24,
                  ),
                  SignUpForm(),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
