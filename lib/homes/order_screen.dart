import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const String id = 'order-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
    );
  }
}
