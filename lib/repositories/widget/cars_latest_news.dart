import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class CardLatestNews extends StatefulWidget {
  final Article articles;
  final String read;
  const CardLatestNews({Key? key, required this.articles,  this.read = "не прочитано"}) : super(key: key);

  @override
  State<CardLatestNews> createState() => _CardLatestNewsState();
}

class _CardLatestNewsState extends State<CardLatestNews> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        height: 103,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 60,
                width: 90,
                imageUrl: widget.articles.imageUrl,
              ),
            ),
            const SizedBox(
              width: 23,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.articles.title,
                      style: AppTextStyle.m16(),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      widget.articles.publicationDate.toString(),
                      style: AppTextStyle.r12(),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.read,
                      style: AppTextStyle.r12(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
