import 'package:whats_in_my_fridge/src/authentication/services/authentication_service.dart';

class AppleAuthenticationService implements AuthenticationService {
  @override
  Future<String> authorize() async {
    // TODO: make an SDK call

    // TODO: return real token;

    return 'test-apple-sso-token';
  }

  @override
  Future<void> unauthorize() async {
    // TODO: make some SDK call?
  }

  static AppleAuthenticationService shared = AppleAuthenticationService();
}
