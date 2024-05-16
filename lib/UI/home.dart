import 'package:flutter/material.dart';
import 'package:news_app/UI/all_news.dart';
import 'package:news_app/UI/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text(
            "THE BGC NEWS",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Breaking News"),
              Tab(text: "All News"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BreakingNews(),
            AllNews(),
          ],
        ),
      ),
    );
  }
}
