// Esre archivo define un modelo de datos para representar un personaje de Naruto, modela los atributos del personaje
// y proporciona un metodo para crear una instancia de la clase a partir de un mapa JSON.
class NarutoCharacter {
  int id;
  String name;
  List<String> images;
  List<String> tools;

  NarutoCharacter({
    required this.id,
    required this.name,
    required this.images,
    required this.tools,
  });

  //Factory es un constructor especial que se utiliza para crear instancias de una clase a partir de datos externos, como un mapa JSON
  //FromJsonMap es un nombre comunmente utilizado para indicar que la funcion convierte un mapa JSON en una instancia de la clase
  //Map<String, dynamic> es el tipo de dato que representa un mapa JSON en Dart, donde las claves son cadenas y los valores pueden ser de cualquier tipo
  //Este metodo es util para convertir los datos obtenidos de una API en objetos de la clase NarutoCharacter

  factory NarutoCharacter.fromJsonMap(Map<String, dynamic> json) {
    return NarutoCharacter(
      id:
          json['id'] ??
          0, // ?? es un operador que devuelve el valor de la izquierda si no es nulo, o el valor de la derecha si es nulo
      name: json['name'] ?? "No Name",
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      tools: json['tools'] != null ? List<String>.from(json['tools']) : [],
    );
  }
}
