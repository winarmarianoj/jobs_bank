import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class BirthDateRegister extends StatelessWidget {
  const BirthDateRegister({
    Key? key,
    required this.registerForm,
  }) : super(key: key);

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.datetime,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintBirthDateRegister,
          labelText: textLabelBirthDateRegister,
          prefixIcon: Icons.date_range),
      onChanged: (value) => registerForm.birthDate = value,
      validator: (value) {                
        return (value != null)
            ? null
            : 'El valor ingresado no es un texto valido';
      },
    );
  }
}
