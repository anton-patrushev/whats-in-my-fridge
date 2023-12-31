import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:whats_in_my_fridge/src/authentication/contexts/auth_state_mode.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/session/token_is_missing.dart';
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
        _currentUserUUID = user.email;
      }
    });
  }

  String? _currentUserUUID;
  AuthStateMode _mode = AuthStateMode.wasNotInitialized;
  String? _token;

  bool _getIsAuthenticated() {
    return _mode == AuthStateMode.authorized;
  }

  bool get isAuthenticated => _getIsAuthenticated();
  bool get wasAuthStateInitialized => _mode != AuthStateMode.wasNotInitialized;
  String get token =>
      _token == null ? throw const TokenIsMissing() : _token as String;
  String get currentUserUUID =>
      _currentUserUUID == null ? '' : _currentUserUUID as String;

  void authenticate({required String token}) {
    _token = token;
    _mode = AuthStateMode.authorized;

    notifyListeners();

    SessionStorage().writeTokenToStorage(token).catchError((e) {
      // TODO: better logging
      print('Writing token to storage failed: $e');
    });
  }

  void unauthenticate() {
    _token = null;
    _mode = AuthStateMode.nonAuthorized;

    notifyListeners();

    FirebaseAuth.instance.currentUser?.delete().catchError((e) {
      // TODO: better logging
      print('Revoking firebase authentication session failed: $e');
    });

    SessionStorage().cleanTokenFromStorage().catchError((e) {
      // TODO: better logging
      print('Cleaning token from storage failed: $e');
    });
  }
}
