import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/styles/colors.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class CardsArticle extends StatefulWidget {
  List<Article> _articles;

  CardsArticle({Key? key, required List<Article> articles})
      : _articles = articles,
        super(key: key);

  @override
  State<CardsArticle> createState() => _CardsArticleState();
}

class _CardsArticleState extends State<CardsArticle> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        widget._articles.length,
        (index) => HeroCarouselCard(
          mockNew: widget._articles[index],
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class HeroCarouselCard extends StatelessWidget {
  final Article mockNew;

  const HeroCarouselCard({Key? key, required this.mockNew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: mockNew.imageUrl,
                fit: BoxFit.fill,
                width: double.infinity,
                alignment: Alignment.center,
                placeholder: (context, url) => Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
              // Image.network(mockNew.imageUrl, fit: BoxFit.cover),
              Positioned(
                bottom: 8.0,
                left: 5.0,
                right: 5.0,
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    mockNew.title,
                    style: AppTextStyle.typography28(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
