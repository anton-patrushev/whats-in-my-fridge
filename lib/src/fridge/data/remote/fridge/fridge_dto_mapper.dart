import 'package:whats_in_my_fridge/src/fridge/models/fridge.dart';

class FridgeDTOMapper {
  FridgeEntity mapDTOToFridge(Map<String, dynamic> dto) =>
      FridgeEntity(uuid: dto['uuid'], name: dto['name'], model: dto['model']);

  Map<String, dynamic> mapCreateFridgeInputToDTO(CreateFridgeInput input) {
    return {
      'name': input.name,
      'model': input.model,
    };
  }

  Map<String, dynamic> mapUpdatedFridgeInputToDTO(UpdateFridgeInput input) {
    var dto = <String, dynamic>{};

    if (input.name != null) {
      dto['name'] = input.name;
    }

    if (input.model != null) {
      dto['model'] = input.model;
    }

    return dto;
  }
}
