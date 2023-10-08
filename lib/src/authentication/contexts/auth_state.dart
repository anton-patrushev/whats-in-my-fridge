import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:whats_in_my_fridge/src/authentication/services/authorization/session/session_storage.dart';

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

    SessionStorage().writeTokenToStorage(token).catchError((e) {
      // TODO: better logging
      print('Writing token to storage failed: $e');
    });
  }

  void unauthenticate() {
    _token = null;

    notifyListeners();

    SessionStorage().cleanTokenFromStorage().catchError((e) {
      // TODO: better logging
      print('Cleaning token from storage failed: $e');
    });
  }

  void updateToken({required String newToken}) {
    _token = newToken;

    notifyListeners();

    SessionStorage().writeTokenToStorage(newToken).catchError((e) {
      // TODO: better logging
      print('Updating token in storage failed: $e');
    });
  }
}
