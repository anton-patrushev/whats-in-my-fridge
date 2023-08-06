abstract class AuthenticationService {
  Future<void> authorize();
  Future<void> unauthorize();
}
