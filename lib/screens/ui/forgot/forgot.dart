import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/service/authenticationService.dart';
import 'package:jobs_bank/widgets/login/emailLoginWidget.dart';
import 'package:jobs_bank/widgets/login/pressButtonForgotWidget.dart';
import 'package:jobs_bank/widgets/register/birthDateRegister.dart';
import 'package:jobs_bank/widgets/register/emailRegister.dart';
import 'package:jobs_bank/widgets/register/identificationRegister.dart';
import 'package:jobs_bank/widgets/register/nameRegister.dart';
import 'package:jobs_bank/widgets/register/phoneNumberRegister.dart';
import 'package:jobs_bank/widgets/register/surnameRegister.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/ui/auth_background.dart';
import 'package:jobs_bank/widgets/ui/card_container.dart';
import 'package:provider/provider.dart';

class Forgot extends StatefulWidget {
  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
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
                    Text(textTitleForgot, style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: ForgotForm(),
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

class ForgotForm extends StatefulWidget {  
  @override
  State<ForgotForm> createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  bool passVisible = true;
  @override
  Widget build(BuildContext context) {    
    var forgotForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: forgotForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            EmailLoginWidget(loginForm: forgotForm),
            SizedBox(height: 30),
            _buildPasswordOne(forgotForm),
            const SizedBox(height: 30),
            _buildPasswordTwo(forgotForm),
            const SizedBox(height: 30),
            PressButtonForgotWidget(context: context, forgotForm: forgotForm),
          ],
        ),
      ),      
    );    
  }

  Widget _buildPasswordOne(LoginFormProvider forgotForm) {
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
            labelText: textLabelTitlePasswordOne,
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
        onChanged: (value) => forgotForm.passwordOne = value,
        validator: (value) {
          return (value != null && value.length > 6) ? null : textInvalidDataPassword;
        },
      );
  }

  Widget _buildPasswordTwo(LoginFormProvider forgotForm) {
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
            labelText: textLabelTitlePasswordTwo,
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
        onChanged: (value) => forgotForm.passwordTwo = value,
        validator: (value) {
          return (value != null && value.length > 6) ? null : textInvalidDataPassword;
        },
      );
  }  

}
