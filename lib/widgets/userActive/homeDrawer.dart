import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/ui/home/myDrawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({Key? key, }) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {

        switch ( state.runtimeType ) {
          
          case UserInitial:
            User newUser = User(id: 0, name: "", lastName: "", 
            phone: "", email: "", password: "", role: "", jwt: "", contacts: []);
            newUser.isLoading = false;
            return BodyDrawer(user: newUser, );

          case UserActive:
            return BodyDrawer(user: (state as UserActive).user, );

          default:
            return Center( child: Text(textUnknownState));
        }
    });
  }  
}