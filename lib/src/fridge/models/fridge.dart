class FridgeEntity {
  final String uuid;
  final String name;
  final String model;
  // final String coverURL; TODO: implement after integrating Cloud Storage service

  const FridgeEntity(
      {required this.uuid, required this.name, required this.model});
}

class CreateFridgeInput {
  final String name;
  final String model;

  const CreateFridgeInput({required this.name, required this.model});
}

class UpdateFridgeInput {
  final String? name;
  final String? model;

  const UpdateFridgeInput({this.name, this.model});
}
