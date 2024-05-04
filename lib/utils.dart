bool isEmail(String value) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
}

bool isValidPassword(String value) {
  return RegExp(r"^[a-zA-Z\d]{8,}$").hasMatch(value);
}
