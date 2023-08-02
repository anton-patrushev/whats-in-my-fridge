import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  AuthState();

  bool _isAuthenticated = true;

  bool get isAuthenticated => _isAuthenticated;

  void authenticate() {
    _isAuthenticated = true;

    notifyListeners();
  }

  void unauthenticate() {
    _isAuthenticated = false;

    notifyListeners();
  }
}
