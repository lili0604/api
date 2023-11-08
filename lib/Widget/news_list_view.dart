import 'package:flutter/material.dart';
import 'api.dart';

class NewsListView extends StatelessWidget {
  final NewsApi api;

  const NewsListView({super.key, required this.api});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: api.fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<dynamic> news = snapshot.data ?? [];

          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(news[index]['title']),
                subtitle: Text(news[index]['description'] ?? 'Sin descripción'),
              );
            },
          );
        }
      },
    );
  }
}
