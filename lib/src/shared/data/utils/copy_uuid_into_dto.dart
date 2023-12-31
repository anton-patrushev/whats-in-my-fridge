Map<String, dynamic> copyUUIDIntoDTO(
    {required String uuid, required Map<String, dynamic> data}) {
  final dto = Map.of(data);
  dto['uuid'] = uuid;

  return dto;
}
