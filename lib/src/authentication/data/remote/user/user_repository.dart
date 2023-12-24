import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_in_my_fridge/src/authentication/errors/release/data/failed_to_save_user_exception.dart';
import 'package:whats_in_my_fridge/src/authentication/models/user.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _usersCollectionName = 'users';

  Map<String, dynamic> _explicitlyMapUserToDTO(UserEntity user) {
    return {
      'firstName': user.fistName,
      'lastName': user.lastName,
    };
  }

  Future<void> createUser(UserEntity user) async {
    try {
      await _db
          .collection(_usersCollectionName)
          .doc(user.uuid)
          .set(_explicitlyMapUserToDTO(user));
    } catch (e) {
      print('Failed to create user with e: $e');

      throw const FailedToSaveUserException();
    }
  }
}
