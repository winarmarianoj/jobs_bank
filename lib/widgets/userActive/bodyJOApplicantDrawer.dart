import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/screens/applicant/bodies/bodyJOApplicant.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class BodyJOApplicantDrawer extends StatelessWidget {
  BodyJOApplicantDrawer({Key? key, }) : super(key: key);  

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
            return BodyJOApplicant(user: (state as UserActive).user, );

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
