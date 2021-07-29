import 'package:ahan/homes/main_screen.dart';
import 'package:ahan/homes/my_bills.dart';
import 'package:ahan/homes/my_order.dart';
import 'package:ahan/widgets/image_slide.dart';
import 'package:ahan/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [HomeScreen(), MyOrderScreen(), MyBills()];
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('My Order'),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Bill'),
              backgroundColor: Colors.orange)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
