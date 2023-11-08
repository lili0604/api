import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApi {
  final String apiKey;

  NewsApi(this.apiKey);

  Future<List<dynamic>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=US&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['articles'];
    } else {
      throw Exception('Error al cargar noticias');
    }
  }
}
