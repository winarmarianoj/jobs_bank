import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/service/authenticationService.dart';

class PressButtonLoginWidget extends StatelessWidget {
  const PressButtonLoginWidget({
    Key? key,
    required this.context, required this.loginForm,
  }) : super(key: key);

  final BuildContext context;
  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      disabledColor: themeLoginDisableButton,
      elevation: 0,
      color: themeLoginSendButton,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80,
            vertical: 15),
          child: Text(
            loginForm.isLoading ? 'Ingresando': 'Aceptar' ,                     
            style: const TextStyle(color: themeLoginStateProccess),
          )), 
      onPressed: loginForm.isLoading && loginForm.email.length!=0 && loginForm.password.length!=0
          ? null
          : () {
              FocusScope.of(context).unfocus();
              if (!loginForm.isValidForm()) return;
              Future.delayed(Duration(seconds: 5));
              AuthenticationService service = AuthenticationService();
              service.getLoginUser(loginForm, context);
          }                     
    );
  }
}