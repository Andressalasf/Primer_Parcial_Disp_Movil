import 'package:dio/dio.dart';
import 'package:primer_parcial_disp_moviles/model/naruto_character.dart';

class NarutoPeticion {
  static const urlBase = "https://dattebayo-api.onrender.com";
  final _dio = Dio();

  //Future es una promesa de que en algun momento se va a completar la tarea asincrona
  //Async es una palabra clave que indica que la funcion es asincrona y puede contener operaciones que toman tiempo en completarse
  //Await es una palabra clave que indica que la funcion debe esperar a que se complete la operacion asincrona
  // antes de continuar con la siguiente linea de codigo

  Future<List<NarutoCharacter>> getCharacter() async {
    final response = await _dio.get('$urlBase/akatsuki');
    final data = response.data["akatsuki"];
    List<NarutoCharacter> pj = [];
    for (int i = 0; i < data.length; i++) {
      pj.add(NarutoCharacter.fromJsonMap(data[i]));
    }
    return pj;
  }
}
