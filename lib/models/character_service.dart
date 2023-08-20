import 'dart:convert';

import 'package:http/http.dart' as http;

import 'character.dart';

class CharacterService {
  static const String _baseUrl = 'http://localhost:8000/api';

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
