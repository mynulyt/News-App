import 'package:flutter/material.dart';
import 'package:news_app/components/news_item_list.dart';
import 'package:news_app/model/api_service.dart';
import 'package:news_app/model/news_model.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    // Replace with your actual content
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getBreakingNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articleList = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItemList(
                    newsModel: articleList[index],
                  );
                },
                itemCount: articleList.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
