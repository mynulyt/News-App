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
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    widget.newsModel.source!.name.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.newsModel.publishedAt.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              widget.newsModel.author == null
                  ? ""
                  : "Written by" + widget.newsModel.author.toString(),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              widget.newsModel.title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6,
            ),
            Text(widget.newsModel.description.toString()),
            SizedBox(
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
                  child: Text("Red More...")),
            ),
          ],
        ),
      ),
    );
  }
}
