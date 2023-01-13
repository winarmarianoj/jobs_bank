import 'package:flutter/material.dart';

class Programmer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/2.jpg",
        width: 600,
        height: 800,
        fit: BoxFit.cover,
      ),
    );
   }
}