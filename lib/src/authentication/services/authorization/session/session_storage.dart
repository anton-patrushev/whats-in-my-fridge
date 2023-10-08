import 'package:whats_in_my_fridge/src/authentication/data/local/secure_storage/encrypted_secure_storage.dart';

class SessionStorage {
  final EncryptedSecureStorage _secureStorage = EncryptedSecureStorage();
  final _tokenStorageKey = "what's-in-my-fridge:authentication-token";

  Future<void> writeTokenToStorage(String token) {
    return _secureStorage.write(key: _tokenStorageKey, value: token);
  }

  Future<String?> readTokenFromStorage() {
    return _secureStorage.read(key: _tokenStorageKey);
  }

  Future<void> cleanTokenFromStorage() {
    return _secureStorage.delete(key: _tokenStorageKey);
  }
}
