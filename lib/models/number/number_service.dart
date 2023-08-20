import 'dart:convert';
import 'package:http/http.dart' as http;
import 'number.dart';

class NumberService {
  // This URL is the IP of my laptop and port 8000. In Laravel,
  // I served the API with php artisan serve --host 0.0.0.0 --port 8000,
  // which allows me to access the API from my phone.
  static const String _baseUrl = 'http://172.25.140.86:8000/api';

  static Future<List<Number>> getNumbers() async {
    final response = await http.get(Uri.parse('$_baseUrl/numbers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      // map each json object to a Character object
      return data.map((json) => Number.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load numbers');
    }
  }
}
