import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/news_feed.dart';

void main() {
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ForestVPN test',
      initialRoute: "/",
      routes: <String,WidgetBuilder>{
        "/": (context) =>  const Articles(),
      },
    );
  }
}
