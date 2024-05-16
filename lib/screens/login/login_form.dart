import 'package:flutter/material.dart';
import 'package:g3_app_mobile/auth.dart';
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
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoginError = false;

  void _submit() async {
    setState(() {
      _isLoginError = false;
    });
    var isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    await postLoginUser(_email.text, _password.text);
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
              controller: _email,
              decoration: const InputDecoration(
                  labelText: "Email", border: inputBorders),
              validator: (value) {
                if (!isEmail(value.toString())) {
                  return "Email inválido";
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _password,
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
            const SizedBox(height: 24),
            _isLoginError
                ? Text("Error al iniciar sesión con ${_email.text}")
                : const SizedBox(),
            ElevatedButton(
                onPressed: _submit, child: const Text("Iniciar sesión")),
          ],
        ),
      ),
    );
  }
}
