import 'package:http/http.dart' as http;
import 'package:bali_app/dto/news.dart';
import 'dart:convert';
import 'package:bali_app/endpoint/endpoint.dart';

class NewsApi {
  static const baseUrl = Endpoints.news;
  // Mengambil daftar berita dari API
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => News.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  // Menambahkan berita baru ke API
  static Future<void> addNews(String title, String body) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{

          'title': title,
          'body': body,
        }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add news');
    }
  }

  // Mengedit berita yang ada di API
  static Future<void> editNews(News news) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${news.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(news.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to edit news');
    }
  }

  // Menghapus berita dari API
  static Future<void> deleteNews(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete news');
    }
  }
}
