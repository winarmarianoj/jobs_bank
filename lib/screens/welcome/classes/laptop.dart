import 'package:flutter/material.dart';

class Laptop extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
          "assets/images/3.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        )
     );
   }
}