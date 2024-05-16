import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class ApiService {
  final String allNewsUrl =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=e3d78229befe4c3e9e996ef9cef702a9";
  final String breakingNewsUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=e3d78229befe4c3e9e996ef9cef702a9";

  Future<List<NewsModel>> getAllNews() async {
    try {
      http.Response response = await http.get(Uri.parse(allNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      http.Response response = await http.get(Uri.parse(breakingNewsUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((dynamic item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Error occurred: $e");
    }
  }
}
