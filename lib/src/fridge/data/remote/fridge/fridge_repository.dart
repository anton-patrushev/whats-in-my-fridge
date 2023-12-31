import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whats_in_my_fridge/src/app/data/remote/constants/db_collections.dart';
import 'package:whats_in_my_fridge/src/fridge/data/remote/fridge/fridge_dto_mapper.dart';
import 'package:whats_in_my_fridge/src/fridge/errors/release/data/failed_to_save_fridge_exception.dart';

import 'package:whats_in_my_fridge/src/fridge/models/fridge.dart';
import 'package:whats_in_my_fridge/src/shared/data/utils/copy_uuid_into_dto.dart';

class FridgeRepository {
  FridgeRepository({required this.currentUserUUID});

  final String currentUserUUID;

  final _db = FirebaseFirestore.instance;
  final _usersCollectionName = DBCollections.users.name;
  final _fridgesCollectionName = DBCollections.fridges.name;
  final _mapper = FridgeDTOMapper();

  DocumentReference<Map<String, dynamic>> _getCurrentUserDocument() =>
      _db.collection(_usersCollectionName).doc(currentUserUUID);

  Future<void> createFridge({required CreateFridgeInput input}) async {
    try {
      await _getCurrentUserDocument()
          .collection(_fridgesCollectionName)
          .add(_mapper.mapCreateFridgeInputToDTO(input));
    } catch (e) {
      print('Failed to create fridge with e: $e');

      throw const FailedToSaveFridgeException();
    }
  }

  Future<void> updateFridge({required UpdateFridgeInput input}) async {
    try {
      await _getCurrentUserDocument()
          .collection(_fridgesCollectionName)
          .add(_mapper.mapUpdatedFridgeInputToDTO(input));
    } catch (e) {
      print('Failed to update fridge with e: $e');

      throw const FailedToSaveFridgeException();
    }
  }

  Stream<List<FridgeEntity>> subscribeToUserFridges() {
    final fridgesDocumentsStream = _getCurrentUserDocument()
        .collection(_fridgesCollectionName)
        .snapshots();

    return fridgesDocumentsStream.transform(StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        final fridges = data.docs.map((document) {
          return _mapper.mapDTOToFridge(copyUUIDIntoDTO(
            uuid: document.id,
            data: document.data(),
          ));
        });

        sink.add(fridges.toList());
      },
    ));
  }
}
