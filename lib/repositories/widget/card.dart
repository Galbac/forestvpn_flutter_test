// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:forestvpn_test/repositories/news/mock_news_repository.dart';
// import 'package:forestvpn_test/repositories/news/models/article.dart';
// import 'package:forestvpn_test/styles/colors.dart';
//
// class Card extends StatefulWidget {
//   const Card({Key? key}) : super(key: key);
//
//   @override
//   State<Card> createState() => _CardState();
// }
//
// class _CardState extends State<Card> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: const Text(
//           "Test",
//           style: TextStyle(color: AppColor.primary),
//         ),
//         backgroundColor: AppColor.secondary,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: AppColor.secondary,
//
//           statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//           statusBarBrightness: Brightness.light, // For iOS (dark icons)
//         ),
//       ),
//       // body:
//       // CarouselSlider(
//       //   items: MockNewsRepository().getFeaturedArticles().then(
//       //           (value) => HeroCarouselCard(mockNew: value)),
//       //   options: CarouselOptions(
//       //     aspectRatio: 2.0,
//       //     enlargeCenterPage: true,
//       //     enableInfiniteScroll: false,
//       //     initialPage: 2,
//       //     autoPlay: true,
//       //   ),
//       //
//       // ),
//     );
//   }
// }
//
// class HeroCarouselCard extends StatelessWidget {
//   final Article mockNew;
//
//   const HeroCarouselCard({Key? key, required this.mockNew}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5.0),
//       child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//           child: Stack(
//             children: <Widget>[
//               Image.network(mockNew.imageUrl, fit: BoxFit.cover, width: 1000.0),
//               Positioned(
//                 bottom: 0.0,
//                 left: 0.0,
//                 right: 0.0,
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromARGB(200, 0, 0, 0),
//                         Color.fromARGB(0, 0, 0, 0)
//                       ],
//                       begin: Alignment.bottomCenter,
//                       end: Alignment.topCenter,
//                     ),
//                   ),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 20.0),
//                   child: Text(
//                     mockNew.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
