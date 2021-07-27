import 'package:ahan/homes/main_screen.dart';
import 'package:ahan/widgets/image_slide.dart';
import 'package:ahan/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: MyAppBar(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageSlider(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 35,
                      child: Lottie.asset('assets/images/food.json'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'All Table For You',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
