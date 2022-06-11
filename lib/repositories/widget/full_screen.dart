import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class FullScren extends StatelessWidget {
  final int index;
  const FullScren({
    Key? key, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: MockNewsRepository().getLatestArticles(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final feeds = snapshot.data;
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator(backgroundColor: Colors.blue);
        } else {
          return FullScreen(fullScreen: feeds![index]);
        }
      },
    );
  }
}

class FullScreen extends StatelessWidget {
  final Article fullScreen;

  const FullScreen({Key? key, required this.fullScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent,
      //   ),
      //   elevation: 0,
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(495),
        child: AppBar(
          backgroundColor: Colors.transparent,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          elevation: 0,
          flexibleSpace:
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: CachedNetworkImage(
              height: 495,
              imageUrl: fullScreen.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 68,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(100, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Expanded(
                child: Text(
                  fullScreen.title,
                  style: AppTextStyle.m28(),
                ),
              ),
            ),
          ),
            ],
          ),
          // Container(
          //   child: ClipRRect(
          //     borderRadius: const BorderRadius.all(Radius.circular(12)),
          //     child: CachedNetworkImage(
          //       height: 495,
          //       imageUrl: fullScreen.imageUrl,
          //       fit: BoxFit.cover,
          //       width: double.infinity,
          //       alignment: Alignment.center,
          //     ),
          //   ),
          // ),
        ),
      ),

      body: ListView(children: [
        Column(
          children: [
            // Stack(
            //   clipBehavior: Clip.none,
            //   children: <Widget>[
                // ClipRRect(
                //   borderRadius: const BorderRadius.all(Radius.circular(12)),
                //   child: CachedNetworkImage(
                //     height: 495,
                //     imageUrl: fullScreen.imageUrl,
                //     fit: BoxFit.cover,
                //     width: double.infinity,
                //     alignment: Alignment.center,
                //   ),
                // ),
                // Positioned(
                //   bottom: 40,
                //   left: 20,
                //   right: 68,
                //   child: Container(
                //     decoration: const BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           Color.fromARGB(100, 0, 0, 0),
                //           Color.fromARGB(0, 0, 0, 0)
                //         ],
                //         begin: Alignment.bottomCenter,
                //         end: Alignment.topCenter,
                //       ),
                //     ),
                //     child: Expanded(
                //       child: Text(
                //         fullScreen.title,
                //         style: AppTextStyle.m28(),
                //       ),
                //     ),
                //   ),
                // ),
            //   ],
            // ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(21),
              child: Text(fullScreen.description.toString()),
            )
          ],
        ),
      ]),
    );
  }
}
