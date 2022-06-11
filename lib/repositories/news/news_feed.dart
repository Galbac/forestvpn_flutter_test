import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';
import 'package:forestvpn_test/repositories/widget/card_featured.dart';
import 'package:forestvpn_test/repositories/widget/cars_latest_news.dart';
import 'package:forestvpn_test/repositories/widget/full_screen.dart';
import 'package:forestvpn_test/styles/colors.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
   bool read = false;
  String str = "не прочитано";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Notifications",
          style: AppTextStyle.r18(),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
                textStyle: AppTextStyle.r18(), primary: Colors.black),
            onPressed: () {
              setState(
                () {
                  read = !read;
                  if(read){
                    str = "не прочитано";
                  }else{
                    str = "прочитано";
                    // read = !read;
                  }

                },
              );
            },
            child:  Text(!read ? "Mark all read":"Remove all read"),
          ),
        ],
        backgroundColor: AppColor.secondary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.secondary,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 28),
                child: Text(
                  "Featured",
                  style: AppTextStyle.m20(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: FutureBuilder<List<Article>>(
                  future: MockNewsRepository().getLatestArticles(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final feeds = snapshot.data;
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator(
                          backgroundColor: Colors.blue);
                    } else {
                      return CardFeatured(articles: feeds!);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 28),
                alignment: Alignment.topLeft,
                child: Text(
                  "Latest news",
                  style: AppTextStyle.m20(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: FutureBuilder<List<Article>>(
                  future: MockNewsRepository().getLatestArticles(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final List feeds = snapshot.data;
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator(
                          backgroundColor: Colors.blue);
                    } else {
                      // return CardLatestNews(articles: feeds!,);
                      return Column(
                        children: List.generate(
                            feeds.length,
                            (index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FullScren(
                                                index: index,
                                              )));
                                },
                                child: CardLatestNews(
                                  articles: feeds[index],
                                  read: str,
                                ))),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
