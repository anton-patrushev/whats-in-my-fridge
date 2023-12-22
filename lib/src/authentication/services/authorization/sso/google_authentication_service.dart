import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:whats_in_my_fridge/src/authentication/services/authorization/authentication_service.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/sso/sso_authentication_failed_exception.dart';
import 'package:whats_in_my_fridge/src/shared/core/errors/release/user_cancelled_operation_exception.dart';

class GoogleAuthenticationService implements AuthenticationService {
  @override
  Future<void> authorize() async {
    try {
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await GoogleSignIn().signIn();

        if (googleUser == null) {
          throw '';
        }
      } catch (e) {
        throw const UserCanceledOperaionException();
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on UserCanceledOperaionException {
      rethrow;
      //
    } catch (e) {
      throw const SSOAuthenticationFailedException();
    }
  }

  static GoogleAuthenticationService shared = GoogleAuthenticationService();
}
