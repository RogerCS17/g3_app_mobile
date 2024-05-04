import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/home/home.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/utils.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    var isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: "Email", border: inputBorders),
              validator: (value) {
                if (!isEmail(value.toString())) {
                  return "Email inválido";
                }
                return null;
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Contraseña", border: inputBorders),
              validator: (value) {
                if (!isValidPassword(value.toString())) {
                  return "Debe contener al menos 8 caracteres";
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: _submit, child: Text("Iniciar sesión")),
          ],
        ),
      ),
    );
  }
}
