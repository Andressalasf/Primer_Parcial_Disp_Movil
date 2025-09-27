import 'package:dio/dio.dart';
import '../model/dragon_ball_character.dart';

class DragonBallPetition {
  final String url = 'https://dragonball-api.com/api';
  final Dio _dio = Dio();

  Future<List<DragonBallCharacter>> getCharacters() async {
    try {
      // Configurar timeout
      _dio.options.connectTimeout = Duration(seconds: 10);
      _dio.options.receiveTimeout = Duration(seconds: 10);

      final response = await _dio.get('$url/characters');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        // Verificar si existe el campo 'items'
        if (data['items'] == null) {
          throw Exception(
            'La API no devolvió datos válidos: campo "items" no encontrado',
          );
        }

        final List<dynamic> items = data['items'];

        // Verificar si la lista está vacía
        if (items.isEmpty) {
          throw Exception('No se encontraron personajes en la API');
        }

        return items
            .map((json) => DragonBallCharacter.fromJsonMap(json))
            .toList();
      } else {
        throw Exception(
          'Error del servidor: ${response.statusCode} - ${response.statusMessage}',
        );
      }
    } on DioException catch (e) {
      // Manejo específico de errores de Dio
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception(
          'Tiempo de conexión agotado. Verifica tu conexión a internet.',
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'Tiempo de respuesta agotado. El servidor tardó demasiado en responder.',
        );
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'Error de conexión. Verifica tu conexión a internet y que la URL sea correcta.',
        );
      } else if (e.response?.statusCode == 404) {
        throw Exception('API no encontrada. Verifica que la URL sea correcta.');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Error interno del servidor. Intenta más tarde.');
      } else {
        throw Exception('Error de red: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error inesperado: $e');
    }
  }
}
