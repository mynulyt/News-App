import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/UI/news_detailes.dart';
import 'package:news_app/model/news_model.dart';

class NewsItemList extends StatelessWidget {
  final NewsModel newsModel;
  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailes(newsModel: newsModel)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    newsModel.source!.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  newsModel.publishedAt.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              newsModel.author == null ? "" : "Written by${newsModel.author}",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              newsModel.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            )
          ],
        ),
      ),
    );
  }
}
