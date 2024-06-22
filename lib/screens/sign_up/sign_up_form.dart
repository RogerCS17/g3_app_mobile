import 'package:flutter/material.dart';
import 'package:g3_app_mobile/services/auth.services.dart';
import 'package:g3_app_mobile/screens/home/home.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/utils.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String _signUpError = "";

  void _submit() async {
    setState(() {
      _signUpError = "";
    });
    var isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    var res = await postRegisterUser(_email.text, _password.text, context);
    if (res != "") {
      setState(() {
        _signUpError = getError(res);
      });
      return;
    } else {
      setState(() {
        _signUpError = "Registrado ${_email.text} exitosamente!";
      });
    }
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
            const SizedBox(height: 12),
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
            _signUpError != ""
                ? Text("Error al registrar ${_email.text}: $_signUpError")
                : const SizedBox(),
            ElevatedButton(onPressed: _submit, child: const Text("Registrar")),
          ],
        ),
      ),
    );
  }
}
