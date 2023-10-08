import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/session/session_was_not_persisted_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/sso/sso_authentication_failed_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/services/authorization/session/session_storage.dart';

class SessionService {
  final SessionStorage _sessionStorage = SessionStorage();

  Future<void> refreshSession() async {
    final token = await _sessionStorage.readTokenFromStorage();

    if (token == null) {
      throw const SessionWasNotPersistedException();
    }

    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithCustomToken(token);

      if (credential.user == null) {
        throw 'Authentication failed';
      }
    } catch (e) {
      throw const SSOAuthenticationFailedException();
    }
  }
}
