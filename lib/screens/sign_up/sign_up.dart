import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/sign_up/sign_up_form.dart';
import 'package:g3_app_mobile/styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 200),
          color: Colors.deepPurple.shade200,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Registrate", style: headline1),
                  const SizedBox(
                    height: 24,
                  ),
                  const SignUpForm(),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Volver a Inicio de sesión"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
