import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/publisher/decorations/decorationPublishForm.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
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
      keyboardType: TextInputType.number,
      decoration: DecorationPublishForm.inputDecoration(
          hintText: hintNumberExperience,
          labelText: labelNumberExperience,
          prefixIcon: Icons.work_history),
      onChanged: (value) => publishForm.experience = value,
      validator: (value) {
        String pattern = numberRegexPattern;
        RegExp regExp = new RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 50)
            ? null
            : invalidFormtaExperience;
      },
    );
  }
}