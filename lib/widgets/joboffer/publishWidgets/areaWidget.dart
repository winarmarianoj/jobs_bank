import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/publisher/decorations/decorationPublishForm.dart';

class AreaWidget extends StatelessWidget {
  const AreaWidget({
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
          hintText: hintTextArea,
          labelText: labelTextArea,
          prefixIcon: Icons.area_chart),
      onChanged: (value) => publishForm.area = value,
      validator: (value) {
        String pattern = textRegexPattern;
        RegExp regExp = new RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 15)
            ? null
            : invalidFormatArea;
      },
    );
  }
}
