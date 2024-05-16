import 'package:flutter/foundation.dart';

class AuthModel extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _uid;
  String? _email;

  bool get isAuthenticated => _isAuthenticated;

  String? get uid => _uid;

  String? get email => _email;

  void setAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }

  void setUid(String? uid) {
    _uid = uid;
    notifyListeners();
  }

  void setEmail(String? email) {
    _email = email;
    notifyListeners();
  }
}
