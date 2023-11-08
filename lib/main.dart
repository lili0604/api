import 'package:api_noticias/Widget/news_list_view.dart';
import 'package:flutter/material.dart';
import 'Widget/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final newsApi = NewsApi('8f1f4ecdfea0416587e5bd340a71112c');

  MyApp({super.key}); // Reemplaza con tu clave API

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Noticias'),
        ),
        body: NewsListView(api: newsApi),
      ),
    );
  }
}
