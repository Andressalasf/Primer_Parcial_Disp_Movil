class DragonBallCharacter {
  int id;
  String name;
  String ki;
  String description;
  String image;

  DragonBallCharacter({
    required this.id,
    required this.name,
    required this.ki,
    required this.description,
    required this.image,
  });

  factory DragonBallCharacter.fromJsonMap(Map<String, dynamic> json) {
    return DragonBallCharacter(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? "Nombre no disponible",
      ki: json['ki']?.toString() ?? "Ki no disponible",
      description:
          json['description']?.toString() ?? "Descripción no disponible",
      image: json['image']?.toString() ?? "no image",
    );
  }
}
