import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class EmailLoginWidget extends StatelessWidget {
  const EmailLoginWidget({
    Key? key,
    required this.loginForm,
  }) : super(key: key);

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.authInputDecoration(
          hintText: textYouEmail,
          labelText: textLabelTitleEmail,
          prefixIcon: Icons.alternate_email_rounded
      ),
      onChanged: (value) => loginForm.email = value,
      validator: (value) {
        String pattern = textRegexPatternEmail;
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value ?? '') ? null : textInvalidData;
      },
    );
  }
}