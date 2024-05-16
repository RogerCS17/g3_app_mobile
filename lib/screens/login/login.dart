import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/login/login_form.dart';
import 'package:g3_app_mobile/screens/sign_up/sign_up.dart';
import 'package:g3_app_mobile/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Inicio de sesión", style: headline1),
                  const SizedBox(
                    height: 24,
                  ),
                  const LoginForm(),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text("¿No tienes una cuenta? Regístrate"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
