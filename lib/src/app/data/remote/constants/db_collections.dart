enum DBCollections {
  users(name: 'users'),
  fridges(name: 'fridges'),
  products(name: 'products');

  const DBCollections({required this.name});
  final String name;
}
