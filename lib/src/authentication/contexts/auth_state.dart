import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  AuthState();

  String? _token;

  bool _getIsAuthenticated() {
    if (_token == null) return false;

    return _token!.isNotEmpty;
  }

  bool get isAuthenticated => _getIsAuthenticated();

  void authenticate({required String token}) {
    _token = token;

    notifyListeners();
  }

  void unauthenticate() {
    _token = null;

    notifyListeners();
  }

  void updateToken({required String newToken}) {
    _token = newToken;
  }
}
