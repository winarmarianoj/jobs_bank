import 'package:flutter/material.dart';
import 'package:jobs_bank/widgets/text/myText.dart';

class ItemCardTextWidget extends StatelessWidget {
  final String? text;
  final String? label;
  final FontWeight? fontWeight;
  final Color? color;

  const ItemCardTextWidget({
    Key? key,
    required this.text, required this.label,
    this.fontWeight, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: MyBodyLargeText(text: label! + text!,
        color: color, fontWeight: fontWeight,)
        
        /* Text(
          label! + text!,
          style: const TextStyle(color: color, fontWeight: fontWeight),
        ), */
      ),
    );
  }
}