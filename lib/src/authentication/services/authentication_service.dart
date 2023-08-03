abstract class AuthenticationService {
  Future<String> authorize();
  Future<void> unauthorize();
}
