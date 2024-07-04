import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isEmail(String value) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
}

bool isValidPassword(String value) {
  return RegExp(r"^['a-zA-Z\d]{8,}$").hasMatch(value);
}

Future<void> storePreferences(Map<String, dynamic> preferences) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  preferences.forEach((key, value) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    }
  });
}

String getError(String error) {
  switch (error) {
    case "Invalid credentials":
      return "Correo o contraseña inválidas";
    case "Email already exists":
      return "El correo ya está registrado";
    default:
      return error;
  }
}

void showNotification(BuildContext context, String message, String type) {
  Color? color;
  if (type == "error") color = Colors.red;
  if (type == "success") color = Colors.green;
  if (type == "info") color = Colors.blue;
  if (type == "warning") color = Colors.orange;

  if (color == null) return;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}
