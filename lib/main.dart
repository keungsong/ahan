import 'package:ahan/SplashScreen/splash_screen.dart';
import 'package:ahan/homes/about_us_screen.dart';
import 'package:ahan/homes/home_screen.dart';
import 'package:ahan/homes/login_screen.dart';
import 'package:ahan/homes/main_screen.dart';
import 'package:ahan/homes/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 5)),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          } else {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
              debugShowCheckedModeBanner: false,
              home: LoginScreen(),
              routes: {
                HomeScreen.id: (context) => HomeScreen(),
                OrderScreen.id: (context) => OrderScreen(),
                AboutUsScreen.id: (context) => AboutUsScreen(),
                MainScreen.id: (context) => MainScreen(),
                LoginScreen.id: (context) => LoginScreen(),
              },
            );
          }
        });
  }
}
