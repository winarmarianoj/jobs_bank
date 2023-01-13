import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class SurnameRegister extends StatelessWidget {
  const SurnameRegister({
    Key? key,
    required this.registerForm,
  }) : super(key: key);

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintTextLastNameRegister,
          labelText: textLabelLastNameRegister,
          prefixIcon: Icons.title),
      onChanged: (value) => registerForm.surname = value,
      validator: (value) {
        String pattern = textRegexPatternByString;
        RegExp regExp = new RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 80)
            ? null
            : textInvalidDataFormat;
      },
    );
  }
}