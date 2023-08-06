import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  AuthState() {
    FirebaseAuth.instance.idTokenChanges().listen((user) {
      if (user == null) {
        unauthenticate();
      } else {
        user.getIdToken().then((value) {
          if (value != null) {
            authenticate(token: value);
          }
        });
      }
    });
  }

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
