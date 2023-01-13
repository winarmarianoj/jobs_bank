import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/publisher/decorations/decorationPublishForm.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.publishForm,
    required this.initialData,
  }) : super(key: key);

  final PublishFormProvider publishForm;
  final String initialData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(      
      initialValue: initialData,     
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: DecorationPublishForm.inputDecoration(
          hintText: hintTextTitle,
          labelText: labelTextTitle,
          prefixIcon: Icons.title),
      onChanged: (value) => publishForm.title = value,
      validator: (value) {
        String pattern = textRegexPattern;
        RegExp regExp = RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 30)
            ? null
            : invalidFormatTitle;
      },
    );
  }
}