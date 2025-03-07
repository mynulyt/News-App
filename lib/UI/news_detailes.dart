import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailes extends StatefulWidget {
  final NewsModel newsModel;
  const NewsDetailes({super.key, required this.newsModel});

  @override
  State<NewsDetailes> createState() => _NewsDetailesState();
}

class _NewsDetailesState extends State<NewsDetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              height: 6,
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
                    widget.newsModel.source!.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.newsModel.publishedAt.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.newsModel.author == null
                  ? ""
                  : "Written by${widget.newsModel.author}",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              widget.newsModel.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(widget.newsModel.description.toString()),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final Uri uri = Uri.parse(widget.newsModel.url.toString());
                    if (!await launchUrl(uri)) {
                      throw Exception("Could not lauch");
                    }
                  },
                  child: const Text("Read More...")),
            ),
          ],
        ),
      ),
    );
  }
}
