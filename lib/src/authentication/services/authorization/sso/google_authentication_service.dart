import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whats_in_my_fridge/src/authentication/data/remote/user/user_repository.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/data/failed_to_save_user_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/models/user.dart';

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
        throw const UserCanceledOperationException();
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        throw 'userCredential.user is null';
      }

      final email = firebaseUser.email;

      if (email == null) {
        throw 'userCredential.user.email is null';
      }

      print(
          'Name: ${firebaseUser.displayName}; uid: ${firebaseUser.uid}; email: ${firebaseUser.email}');

      await UserRepository().createUser(UserEntity(uuid: email));
    } on UserCanceledOperationException {
      rethrow;
    } on FailedToSaveUserException {
      rethrow;
    } catch (e) {
      throw const SSOAuthenticationFailedException();
    }
  }

  static GoogleAuthenticationService shared = GoogleAuthenticationService();
}
