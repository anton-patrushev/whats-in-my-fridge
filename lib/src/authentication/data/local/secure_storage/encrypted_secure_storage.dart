import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:whats_in_my_fridge/src/authentication/data/local/secure_storage/secure_storage.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/secure_storage/deleting_from_secure_storage_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/secure_storage/reading_from_secure_storage_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/secure_storage/resetting_secure_storage_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/secure_storage/writing_to_secure_storage_exception.dart';

class EncryptedSecureStorage implements SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  @override
  Future<void> delete({required String key}) async {
    try {
      await _flutterSecureStorage.delete(key: key);
    } catch (e) {
      throw const DeletingFromSecureStorageException();
    }
  }

  @override
  Future<String?> read({required String key}) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (e) {
      throw const ReadingFromSecureStorageException();
    }
  }

  @override
  Future<void> reset() async {
    try {
      await _flutterSecureStorage.deleteAll();
    } catch (e) {
      throw const ResettingSecureStorageException();
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
    } catch (e) {
      throw const WritingToSecureStorageException();
    }
  }
}
