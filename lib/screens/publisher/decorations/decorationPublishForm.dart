import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';

class DecorationPublishForm {
  static InputDecoration inputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: themeDecorationPublishFormBorderSide),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: themeDecorationPublishFormFocusedBorder, width: 2)),
        hintText: hintText,
        hintStyle: const TextStyle(color: themeDecorationPublishFormHintStyle),
        labelText: labelText,
        labelStyle: const TextStyle(color: themeDecorationPublishFormHintStyle, fontWeight: FontWeight.bold, fontSize: 25),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: themeDecorationPublishFormPrefixIcon,
            )
            : null);
  }
}