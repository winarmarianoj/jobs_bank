import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/images/1.jpg",
        width: 600,
        height: 800,
        fit: BoxFit.cover,
      ),
     );
   }
}