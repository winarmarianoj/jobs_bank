import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: this.child,
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: themeCardContainerBoxDecorationCardShape,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: themeCardContainerBoxDecorationBoxShadow,
              blurRadius: 15,
              offset: Offset(
                0,
                5,
              ),
            )
          ]);
}