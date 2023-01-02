import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  const MyText({Key? key, required this.text,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: const TextStyle(
        color: kTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MyProfileText extends StatelessWidget {
  final String text;
  final Color? color;
  const MyProfileText({Key? key, required this.text,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     text,
      style: const TextStyle(
        color: kTextColor,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class MyHeadline5Text extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyHeadline5Text({Key? key, 
  required this.text,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme(headline5: TextStyle(color: color, fontWeight: fontWeight),);
    return Text(
      text,
      style:  Theme.of(context).textTheme.headline5
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}

class MyBodyMediumText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const MyBodyMediumText({Key? key, 
  required this.text,
  required this.color, required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: 
      TextStyle(
        fontFamily: "Arial",
        fontSize: 14,
        fontWeight: fontWeight,
      )
      /* Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: color, fontWeight: fontWeight), */
    );    
  }
}

class MyTitleMediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const MyTitleMediumText({Key? key, 
  required this.text,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: color, fontWeight: fontWeight),
    );    
  }
}

class MyBodyLargeText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  const MyBodyLargeText({Key? key, 
  required this.text, this.size,
  this.color, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: color, fontWeight: fontWeight, fontSize: size,),
    );    
  }
}