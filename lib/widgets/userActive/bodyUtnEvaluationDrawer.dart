import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/screens/utn/bodies/bodyEvaluation.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class BodyUtnEvaluationDrawer extends StatelessWidget {
  BodyUtnEvaluationDrawer({Key? key, }) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {        

        switch ( state.runtimeType ) {
          
          case UserInitial:            
            return CustomPopup(
              title: textTitleProfile,
              message: textNoDataUserInitial,
              buttonAccept: BounceButton(
                buttonSize: ButtonSize.small,
                type: ButtonType.primary,
                label: textButtonShowDialogProfile,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ); 

          case UserActive:
            return BodyEvaluation(user: (state as UserActive).user, );

          default:
            return CustomPopup(
              title: textTitleProfile,
              message: textUnknownState,
              buttonAccept: BounceButton(
                buttonSize: ButtonSize.small,
                type: ButtonType.primary,
                label: textButtonShowDialogProfile,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ); 
        }        
    });
  }  
}
