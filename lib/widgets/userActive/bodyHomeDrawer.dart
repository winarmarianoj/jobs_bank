import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/bodyHome.dart';
import 'package:jobs_bank/screens/ui/home/bodyDrawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class BodyHomeDrawer extends StatelessWidget {
  BodyHomeDrawer({Key? key, }) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {        

        switch ( state.runtimeType ) {
          
          case UserInitial:
            User newUser = User(id: 0, name: "", lastName: "", 
            phone: "", email: "", password: "", role: "", jwt: "", contacts: []);
            newUser.isConected = false;
            return BodyHome(user: newUser, );

          case UserActive:
          //TODO si esta desconectado y necesito el user.id enviar el loginform
            return BodyHome(user: (state as UserActive).user, );

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