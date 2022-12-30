import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';

class LinkButton extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final IconData? iconRight;
  final IconData? iconLeft;
  final Color? color;
  final TextAlign? labelAlign;
  final VoidCallback? onPressed;
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;

  const LinkButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.iconRight,
    this.iconLeft,
    this.labelStyle,
    this.color,
    this.mainAxisSize,
    this.mainAxisAlignment,
    this.labelAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final finalColor = color ?? primaryColorDark;
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        children: [
          if (iconLeft != null)
            Row(
              children: [
                Icon(
                  iconLeft,
                  color: finalColor,
                  size: 20,
                ),
              ],
            ),
          Flexible(
            child: Text(
              label,
                  style: TextStyle(color: themeLoginStateProccess),
              textAlign: labelAlign,
            ),
          ),
          if (iconRight != null)
            Row(
              children: [    
                Icon(
                  iconRight,
                  color: finalColor,
                  size: 20,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
