import 'package:http/http.dart' as http;
import 'dart:convert';

class PaisService {
  final String baseUrl = 'https://restcountries.com/v3.1';

  // Buscar país por nombre
  Future<Map<String, dynamic>> buscarPorNombre(String nombre) async {
    final url = Uri.parse('$baseUrl/name/$nombre');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decodificar y manejar como lista (primer elemento)
      final data = json.decode(response.body);
      if (data is List && data.isNotEmpty) {
        return data[0]; // Retornar el primer país encontrado
      } else {
        throw Exception('No se encontró información del país por nombre.');
      }
    } else {
      throw Exception('Error al consultar por nombre: ${response.statusCode}');
    }
  }

  // Buscar país por código
  Future<Map<String, dynamic>> buscarPorCodigo(String codigo) async {
    final url = Uri.parse('$baseUrl/alpha/$codigo');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decodificar y manejar como mapa
      final data = json.decode(response.body);
      if (data is Map<String, dynamic>) {
        return data;
      } else {
        throw Exception('Error inesperado en la resspuesta del API.');
      }
    } else {
      throw Exception('Error al consultar por coodigo: ${response.statusCode}');
    }
  }
}
