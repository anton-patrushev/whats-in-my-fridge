import 'package:firebase_auth/firebase_auth.dart';
import 'package:whats_in_my_fridge/src/authentication/services/authorization/authentication_service.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/sso/sso_authentication_failed_exception.dart';

class AppleAuthenticationService implements AuthenticationService {
  @override
  Future<void> authorize() async {
    try {
      final appleProvider = AppleAuthProvider();

      await FirebaseAuth.instance.signInWithProvider(appleProvider);
    } catch (e) {
      throw const SSOAuthenticationFailedException();
    }
  }

  @override
  Future<void> unauthorize() async {
    // TODO: make some SDK call?
  }
}
