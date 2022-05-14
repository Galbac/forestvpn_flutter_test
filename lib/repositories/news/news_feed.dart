import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:forestvpn_test/repositories/widget/card.dart';
import 'package:forestvpn_test/styles/colors.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Test",
          style: TextStyle(color: AppColor.primary),
        ),
        backgroundColor: AppColor.secondary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.secondary,

          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: ListView(children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                "Featured",
                style: AppTextStyle.typography20(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(

              padding: const EdgeInsets.only(left: 28, right: 28),
              // color: Colors.red,
              child: FutureBuilder<List<Article>>(
                future: MockNewsRepository().getLatestArticles(),
                builder: (context, snapshot) {
                  final feeds = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Ошибка"),
                        );
                      } else {
                        return
                            // buildArticle(feeds!);
                            CardsArticle(articles: feeds!);
                      }
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 28),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Latest news",
                      style: AppTextStyle.typography20(),
                    )),
                Row(),
              ],
            )
          ],
        ),
      ]),
    );
  }

  Widget buildArticle(List<Article> feeds) => ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          final feed = feeds[index];

          return CardsArticle(
            articles: feeds,
          );
          // CarouselSlider(items: , options: options)
          // return ListTile(
          //   leading: CircleAvatar(
          //     backgroundImage: NetworkImage(feed.imageUrl),
          //   ),
          //   title: Text(feed.title),
          //   subtitle: Text(feed.id),
          // );
        },
      );
}
