import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class IdentificationRegister extends StatelessWidget {
  const IdentificationRegister({
    Key? key,
    required this.registerForm,
  }) : super(key: key);

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.number,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintIdentificationRegister,
          labelText: textLabelIdentificationRegister,
          prefixIcon: Icons.document_scanner),
      onChanged: (value) => registerForm.identification = value,
      validator: (value) {
        String pattern = textRegexPatternByPhoneNumber;
        RegExp regExp = new RegExp(pattern);
        bool reg = regExp.hasMatch(value ?? '')
            ? true
            : false;
        return (reg && value != null && value.length <= 11)
            ? null
            : textIdentificationInvalidDataFormat;
      },
    );
  }
}
