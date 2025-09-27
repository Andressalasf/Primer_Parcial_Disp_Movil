import 'package:primer_parcial_disp_moviles/helpers/dragon_ball_petition.dart';
import 'package:primer_parcial_disp_moviles/model/dragon_ball_character.dart';
import 'package:flutter/material.dart';

class PeticionScreen extends StatelessWidget {
  const PeticionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = DragonBallPetition();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dragon ball characters",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: FutureBuilder(
          future: petition.getCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return ListCharacter(character: snapshot.requireData);
          },
        ),
      ),
    );
  }
}

class ListCharacter extends StatelessWidget {
  final List<DragonBallCharacter> character;

  const ListCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: character.length,
      itemBuilder: (context, index) {
        final size = MediaQuery.of(context).size;
        DragonBallCharacter pj = character[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: () {
              print("Di tap hermano");
            },
            contentPadding: EdgeInsets.all(16),
            title: Row(
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child:
                      pj.image.isNotEmpty &&
                          pj.image != "no image" &&
                          pj.image != "No image"
                      ? CircleAvatar(
                          radius: (size.width * 0.15) / 2,
                          backgroundColor: Colors.grey[300],
                          child: Image.network(
                            pj.image,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.error,
                                color: Colors.red[400],
                                size: 30,
                              );
                            },
                          ),
                        )
                      : Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pj.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ki del personaje:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: pj.ki.split(',').map((res) {
                          return Chip(
                            label: Text(res),
                            backgroundColor: Colors.orange[100],
                            labelStyle: TextStyle(fontSize: 12),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 8),
                      Text(
                        pj.description,
                        style: TextStyle(fontSize: 12),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
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

//se usa width en ambas pq si ponemos height tomaria el alto total de la pantalla y quedaria desproporcionado
//index, la iteracion de cada elemento
//row para crear objetos uno al lado del otro, una fila
//la funcion flecha no crea return, toma la primera linea que encuentra
//el itemBuilder es una función que se ejecuta por cada elemento de la lista
//listview sabe que la cantidad que enviaré, si se agrega el builder es para no definir cuantos se enviarán
//el entity es como voy a tratar el modelo, el modelo es la estructura de datos
//un modelo es una clase que representa un objeto
//el usecase es la lógica de negocio, es decir, que voy a hacer con los datos
//el repository es la abstracción de los datos, es decir, como voy a obtener los datos
//el datasource es la implementación de los datos, es decir, como voy a obtener los datos
//el helper es una clase que me ayuda a hacer algo, por ejemplo, una clase que me ayuda a hacer peticiones http
//los cors son bloqueos de origen cruzado, es decir, que no puedo hacer peticiones a un servidor que no es el mismo que el de mi aplicación
//para solucionar esto, puedo usar un proxy, que es un servidor intermedio que hace la petición por mí
//o puedo usar una extensión de navegador que me permita hacer peticiones a cualquier servidor
