import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forestvpn_test/styles/colors.dart';
import 'package:forestvpn_test/styles/text_styles.dart';

class Article extends StatelessWidget {
  const Article({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Журнал звонков',
          style: TextStyle(color: AppColor.primary),
        ),
        backgroundColor: AppColor.secondary,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColor.secondary,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              "Featured",
              style: AppTextStyle.typography(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 358,
            padding: const EdgeInsets.all(28),
            color: Colors.red,
            child: Row(
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(28),
                  color: Colors.black,
                )
              ],
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
                    style: AppTextStyle.typography(),
                  )),
              Row(
                Co
              ),
            ],

          )
        ],
      ),
    );
  }
}
