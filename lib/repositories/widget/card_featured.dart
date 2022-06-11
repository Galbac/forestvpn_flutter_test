import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/repositories/widget/full_screen.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class CardFeatured extends StatefulWidget {
  final List<Article> _articles;

  const CardFeatured({Key? key, required List<Article> articles})
      : _articles = articles,
        super(key: key);

  @override
  State<CardFeatured> createState() => _CardFeaturedState();
}

class _CardFeaturedState extends State<CardFeatured> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        widget._articles.length,
        (index) => InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> FullScren(index: index,)));
          },
          child: HeroCarouselCard(
            mockFeature: widget._articles[index],
          ),
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 1,
        initialPage: 0,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
    );
    // );
  }
}

class HeroCarouselCard extends StatelessWidget {
  final Article mockFeature;

  const HeroCarouselCard({Key? key, required this.mockFeature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            height: 300,
            imageUrl: mockFeature.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: 40.0,
            left: 20.0,
            right: 68.0,
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
              child: Text(
                mockFeature.title,
                style: AppTextStyle.m28(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
