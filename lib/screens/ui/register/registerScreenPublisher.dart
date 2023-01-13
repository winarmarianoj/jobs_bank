import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/service/authenticationService.dart';
import 'package:jobs_bank/widgets/register/emailRegister.dart';
import 'package:jobs_bank/widgets/register/identificationRegister.dart';
import 'package:jobs_bank/widgets/register/nameRegister.dart';
import 'package:jobs_bank/widgets/register/phoneNumberRegister.dart';
import 'package:jobs_bank/widgets/register/surnameRegister.dart';
import 'package:jobs_bank/widgets/register/webPageRegister.dart';
import 'package:jobs_bank/widgets/ui/auth_background.dart';
import 'package:jobs_bank/widgets/ui/card_container.dart';
import 'package:provider/provider.dart';

class RegisterScreenPublisher extends StatefulWidget {
  @override
  State<RegisterScreenPublisher> createState() => _RegisterScreenStatePublisher();
}

class _RegisterScreenStatePublisher extends State<RegisterScreenPublisher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(textTitleRegister, style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => RegisterFormProvider(),
                      child: RegisterFormPublisher(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),              
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormPublisher extends StatefulWidget {  
  @override
  State<RegisterFormPublisher> createState() => _RegisterFormStatePublisher();
}

class _RegisterFormStatePublisher extends State<RegisterFormPublisher> {
  bool passVisible = true;
  @override
  Widget build(BuildContext context) {    
    var registerForm = Provider.of<RegisterFormProvider>(context);     
    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            NameRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            SurnameRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            IdentificationRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            PhoneNumberRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            EmailRegister(registerForm: registerForm),
            const SizedBox(height: 5),
            _buildPassword(registerForm),
            const SizedBox(height: 5),
            WebPageRegister(registerForm: registerForm),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: themeLoginDisableButton,
              elevation: 0,
              color: themeRegisterButton,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80,
                   vertical: 15),
                  child: Text(
                    registerForm.isLoading ? 'Ingresando': 'Registrarme' ,                     
                    style: const TextStyle(color: themeLoginStateProccess),
                  )), 
              onPressed: registerForm.isLoading && registerForm.email.length!=0 && registerForm.password.length!=0
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      if (!registerForm.isValidForm()) return;
                      Future.delayed(Duration(seconds: 5));
                      AuthenticationService service = AuthenticationService();
                      service.registerPublisher(registerForm, context);
                    }                    
            ),
          ],
        ),
      ),      
    );    
  }

  Widget _buildPassword(RegisterFormProvider registerForm) {
    return TextFormField(
        autocorrect: false,
        obscureText: passVisible,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: themeInputDecorationLogin),
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: themeInputDecorationLogin, width: 2)),
            hintText: textFormatPassword,
            labelText: textLabelTitlePassword,
            labelStyle: const TextStyle(color: themeInputDecorationLoginLabel),
            prefixIcon: Icons.remove_red_eye_outlined != null
                ? Icon(
                    Icons.remove_red_eye_outlined,
                    color: themeInputDecorationLogin,
                  )
                : null,
            suffixIcon: IconButton(
              icon: Icon(
                passVisible 
                  ? Icons.visibility
                  : Icons.visibility_off,
                  color: themeInputDecorationLogin,
              ),
              onPressed: (() {
                setState(() {
                  passVisible = !passVisible;
                });
              })
            ),
        ),
        onChanged: (value) => registerForm.password = value,
        validator: (value) {
          return (value != null && value.length > 6) ? null : textInvalidDataPassword;
        },
      );
  }
}
