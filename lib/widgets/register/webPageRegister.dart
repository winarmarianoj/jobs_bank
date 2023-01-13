import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';

class WebPageRegister extends StatelessWidget {
  const WebPageRegister({
    Key? key,
    required this.registerForm,
  }) : super(key: key);

  final RegisterFormProvider registerForm;

  @override
  Widget build(BuildContext context) {
    return TextFormField(           
      autocorrect: false,
      keyboardType: TextInputType.url,
      decoration: InputDecorations.authInputDecoration(
          hintText: textHintWebSiteRegister,
          labelText: textLaberWebSiteRegister,
          prefixIcon: Icons.web),
      onChanged: (value) => registerForm.webPage = value,
      validator: (value) {                
        return (value != null)
            ? null
            : textErrorWebSiteRegister;
      },
    );
  }
}