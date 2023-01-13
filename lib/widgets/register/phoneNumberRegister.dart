import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class PhoneNumberRegister extends StatelessWidget {
  const PhoneNumberRegister({
    Key? key,
    required this.registerForm,
  }) : super(key: key);

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintTextPhoneRegister,
          labelText: textLabelPhoneRegister,
          prefixIcon: Icons.phone),
      onChanged: (value) => registerForm.phoneNumber = value,
      validator: (value) {
        String pattern = textRegexPatternByPhoneNumber;
        RegExp regExp = new RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 15)
            ? null
            : textPhoneInvalidDataFormat;
      },
    );
  }
}
