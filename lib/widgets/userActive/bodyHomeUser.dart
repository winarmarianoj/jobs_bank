import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/components/joboffer/bodyHome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyHomeUser extends StatelessWidget {
  const BodyHomeUser({Key? key, }) : super(key: key);  

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {

        switch ( state.runtimeType ) {
          
          case UserInitial:
            return Center(child: Text(textNoDataUserInitial));

          case UserActive:
            //return BodyHome(user: (state as UserActive).user, );

          default:
            return Center( child: Text(textUnknownState));
        }
    });
  }  
}