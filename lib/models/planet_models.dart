class Planet {
  final String name;
  final String description;
  final String imageUrl;

  Planet({required this.name, required this.description, required this.imageUrl});

  factory Planet.fromMap(Map<String, String> map) {
    return Planet(
      name: map['name'] ?? '',
      description: map['desc'] ?? '',
      imageUrl: map['img'] ?? '',
    );
  }
}
