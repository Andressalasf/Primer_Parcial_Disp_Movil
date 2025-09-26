import 'package:primer_parcial_disp_moviles/helpers/naruto_peticion.dart';
import 'package:primer_parcial_disp_moviles/model/naruto_character.dart';
import 'package:flutter/material.dart';

class PeticionScreen extends StatelessWidget {
  const PeticionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = NarutoPeticion();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Peticion Screen',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.indigoAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: petition.getCharacter(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: ${snapshot.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Recargar la página
                        Navigator.pushReplacementNamed(context, 'peticion');
                      },
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasData) {
              return ListCharacter(characters: snapshot.data!);
            }
            return const Center(child: Text('No hay datos disponibles'));
          },
        ),
      ),
    );
  }
}

class ListCharacter extends StatelessWidget {
  final List<NarutoCharacter> characters;
  const ListCharacter({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];

        // Versión simple con Card
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Imagen del personaje (simple)
                CircleAvatar(
                  radius: 30, // Tamaño del círculo
                  backgroundImage:
                      character.images.isNotEmpty &&
                          character.images[0].isNotEmpty
                      ? NetworkImage(
                          character.images[0],
                        ) // Si hay imagen, la muestra
                      : null, // Si no hay imagen, no muestra nada
                  backgroundColor:
                      Colors.grey[300], // Color de fondo si no hay imagen
                  child: character.images.isEmpty || character.images[0].isEmpty
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                        ) // Ícono si no hay imagen
                      : null, // Si hay imagen, no muestra ícono
                ),
                const SizedBox(width: 16), // Espacio entre imagen y texto
                // Informacion del personaje
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('ID: ${character.id}'),
                      Text('Tools: ${character.tools.length}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//entity es la clase que representa los datos y sus atributos
//repository es la clase que maneja la logica de datos
//model es la clase que convierte los datos de json a entity y ademas maneja la logica de datos
//helpers es la clase que maneja las peticiones http y la conexion a internet y ademas contiene funciones auxiliares para el manejo de datos
// CORS es un mecanismo de seguridad que implementan los navegadores para evitar que una página web pueda hacer peticiones a un dominio diferente al que la sirvió. Esto se hace para proteger al usuario de ataques de tipo cross-site scripting (XSS) y cross-site request forgery (CSRF).
// En Flutter, al ser una aplicación móvil, no se aplican las mismas restricciones de CORS que en una aplicación web. Por lo tanto, no es necesario configurar CORS en Flutter para hacer peticiones a diferentes dominios.
//snapshot es un objeto que contiene el estado actual de la petición asincrona, incluyendo si se esta cargando, si se completo con exito o si hubo un error
//requireData es una propiedad que devuelve los datos obtenidos de la peticion asincrona
