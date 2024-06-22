import 'package:flutter/foundation.dart';

class AuthModel extends ChangeNotifier {
  String? _id;
  String? _email;
  String? _name;
  bool _isAuthenticated = false;

  String? get id => _id;
  String? get email => _email;
  String? get name => _name;
  bool get isAuthenticated => _isAuthenticated;

  void setIsAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }

  void setId(String? id) {
    _id = id;
    notifyListeners();
  }

  void setEmail(String? email) {
    _email = email;
    notifyListeners();
  }

  void setName(String? name) {
    _name = name;
    notifyListeners();
  }
}
