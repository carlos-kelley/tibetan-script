import 'dart:convert';
import 'package:http/http.dart' as http;
import 'character.dart';

class CharacterService {
  // This URL is the IP of my laptop and port 8000. In Laravel,
  // I served the API with php artisan serve --host 0.0.0.0 --port 8000,
  // which allows me to access the API from my phone.
  static const String _baseUrl = 'http://172.25.140.86:8000/api';

  static Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$_baseUrl/characters'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
