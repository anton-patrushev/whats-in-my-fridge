import 'package:whats_in_my_fridge/src/authentication/services/authentication_service.dart';

class GoogleAuthenticationService implements AuthenticationService {
  @override
  Future<String> authorize() async {
    // TODO: make an SDK call

    // TODO: return real token;

    return 'test-google-sso-token';
  }

  @override
  Future<void> unauthorize() async {}

  static GoogleAuthenticationService shared = GoogleAuthenticationService();
}
