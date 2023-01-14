import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/service/authenticationService.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class PressButtonForgotWidget extends StatelessWidget {
  const PressButtonForgotWidget({
    Key? key,
    required this.context, required this.forgotForm,
  }) : super(key: key);

  final BuildContext context;
  final LoginFormProvider forgotForm;

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
            forgotForm.isLoading ? 'Ingresando': 'Aceptar' ,                     
            style: const TextStyle(color: themeLoginStateProccess),
          )), 
      onPressed: forgotForm.isLoading && forgotForm.email.length!=0 
      && forgotForm.passwordOne.length!=0 && forgotForm.passwordTwo.length!=0
          ? null
          : () {
            if(forgotForm.passwordOne == forgotForm.passwordTwo){
              FocusScope.of(context).unfocus();
              if (!forgotForm.isValidForm()) return;
              Future.delayed(Duration(seconds: 5));
              AuthenticationService service = AuthenticationService();
              service.restorePassword(forgotForm, context);
            }else{
              log(logForgotFailed);
              showDialog(
                context: context, 
                builder: (_) => CustomPopup(
                    title: textResultForgotTitle,
                    message: logForgotFailed,
                    buttonAccept: BounceButton(
                      iconLeft: Icons.error,
                      buttonSize: ButtonSize.small,
                      type: ButtonType.primary,
                      label: textButtonShowDialogForgot,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
              );     
            }              
          }                     
    );
  }
}