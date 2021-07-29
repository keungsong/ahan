import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: Container(),
      title: Row(
        children: [
          Text('LOGO'),
          Icon(Icons.ac_unit),
          SizedBox(
            width: 10,
          ),
          Text('Restaurant name'),
        ],
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search Food...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Colors.white),
          ),
        ),
      ),
    );
  }
}
