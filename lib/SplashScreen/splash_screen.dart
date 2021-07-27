import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.blue,
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 30,
      fontFamily: 'Bebas Neue',
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 70,
              child: Lottie.asset('assets/images/food.json'),
            ),
            SizedBox(
              height: 15,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText('Company name',
                    textStyle: colorizeTextStyle, colors: colorizeColors),
              ],
              isRepeatingAnimation: true,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
