import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:jobs_bank/screens/welcome/headerPage.dart';
import 'package:jobs_bank/service/authenticationService.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/ui/auth_background.dart';
import 'package:jobs_bank/widgets/ui/card_container.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';
import 'package:provider/provider.dart';

class RegisterScreenApplicant extends StatefulWidget {
  @override
  State<RegisterScreenApplicant> createState() => _RegisterScreenStateApplicant();
}

class _RegisterScreenStateApplicant extends State<RegisterScreenApplicant> {
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
                      child: RegisterFormApplicant(),
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

class RegisterFormApplicant extends StatefulWidget {  
  @override
  State<RegisterFormApplicant> createState() => _RegisterFormStateApplicant();
}

class _RegisterFormStateApplicant extends State<RegisterFormApplicant> {
  bool passVisible = true;
  String selectedGenre = '';
  String selectedTypeStudent = '';
  @override
  Widget build(BuildContext context) {    
    var registerForm = Provider.of<RegisterFormProvider>(context);     
    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: textHintTextNameRegister,
                  labelText: textLabelNameRegister,
                  prefixIcon: Icons.title),
              onChanged: (value) => registerForm.name = value,
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
            ),
            const SizedBox(height: 5),
            TextFormField(           
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
            ),
            const SizedBox(height: 5),
            TextFormField(           
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
            ),
            const SizedBox(height: 5),
            TextFormField(           
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
            ),
            const SizedBox(height: 5),
            TextFormField(
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
            ),
            const SizedBox(height: 5),
            TextFormField(
              autocorrect: false,
              obscureText: passVisible,
              keyboardType: TextInputType.visiblePassword,
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
                return (value != null && value.length > 6) ? null : textInvalidDataPassword; },
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField(
              items: <String>['FEMENINO', 'MASCULINO', 'OTRO'].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: MyText(text: textSelectedRoleInRegister),
              onSaved: (value) {
                setState(() {
                  selectedGenre = value!;
                });
              }, 
              onChanged: (value) {
                setState(() {
                  selectedGenre = value!;
                  registerForm.genre = value;
                });
              },
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField(
              items: <String>['ACTIVE', 'REGULAR', 'RECEIVED'].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: MyText(text: textSelectedRoleInRegister),
              onSaved: (value) {
                setState(() {
                  selectedTypeStudent = value!;
                });
              }, 
              onChanged: (value) {
                setState(() {
                  selectedTypeStudent = value!;
                  registerForm.typeStudent = value;
                });
              },
            ),
            const SizedBox(height: 5),
            TextFormField(           
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
            ),
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
                      service.registerApplicant(registerForm, context);
                    }                    
            ),
          ],
        ),
      ),      
    );    
  }
}