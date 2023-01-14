import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/screens/ui/forgot/forgot.dart';
import 'package:jobs_bank/screens/ui/register/registerScreenApplicant.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/login/emailLoginWidget.dart';
import 'package:jobs_bank/widgets/login/pressButtonLoginWidget.dart';
import 'package:jobs_bank/screens/ui/register/registerScreenPublisher.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/ui/auth_background.dart';
import 'package:jobs_bank/widgets/ui/card_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = '';
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
                    Text(textTitle, style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(textNewAccount, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                items: <String>['Estudiante', 'Empresa'].map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                hint: MyText(text: textSelectedRoleInRegister),
                onSaved: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                }, 
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                    if(selectedRole == 'Estudiante'){
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreenApplicant())));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterScreenPublisher())));
                    }
                  });
                },
              ),
              const SizedBox(height: 50),
              const Text(textChangePassword, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
              ),
              const SizedBox(height: 10),
              BounceButton(
                buttonSize: ButtonSize.small, 
                type: ButtonType.subscriptos, 
                label: textRestorePassword,
                iconLeft: Icons.password,
                textColor: buttonChangeProfile,
                horizontalPadding: true,
                contentBasedWidth: true,
                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Forgot())));
                },
              ),  
              const SizedBox(height: 50),                     
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool passVisible = true;
  @override
  Widget build(BuildContext context) {
    var loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            EmailLoginWidget(loginForm: loginForm),
            SizedBox(height: 30),
            _buildPassword(loginForm),
            const SizedBox(height: 30),
            PressButtonLoginWidget(context: context, loginForm: loginForm),
          ],
        ),
      ),      
    );    
  }

  Widget _buildPassword(LoginFormProvider loginForm) {
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
        onChanged: (value) => loginForm.passwordOne = value,
        validator: (value) {
          return (value != null && value.length > 6) ? null : textInvalidDataPassword;
        },
      );
  }
}





