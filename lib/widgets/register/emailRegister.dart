import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class EmailRegister extends StatelessWidget {
  const EmailRegister({
    Key? key,
    required this.registerForm,
  }) : super(key: key);

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
          hintText: textYouEmail,
          labelText: textLabelTitleEmail,
          prefixIcon: Icons.alternate_email_rounded),
      onChanged: (value) => registerForm.email = value,
      validator: (value) {
        String pattern = textRegexPatternEmail;                    
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : textInvalidData; },
    );
  }
}