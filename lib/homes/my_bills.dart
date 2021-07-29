import 'package:flutter/material.dart';

class MyBills extends StatelessWidget {
  static const String id = 'my-bill';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bill'),
      ),
    );
  }
}
