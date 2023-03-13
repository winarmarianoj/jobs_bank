import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/home/home.dart';
import 'package:jobs_bank/screens/profile/profileUser.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';
import 'package:jobs_bank/widgets/userActive/bodyHomeDrawer.dart';
import 'package:jobs_bank/widgets/userActive/bodyProfileDrawer.dart';

class ProfileService {
  final String baseHeroku = 'https://bolsadetrabajo.herokuapp.com/';
  final String baseLocalhost = 'http://localhost:8082/';
  final String baseLocal = 'http://10.0.2.2:8082/';
  
  Future<User?> changeUser(User newUser, BuildContext context) async{
    var url = Uri.parse(baseLocalhost + 'flutter/changeuser/' + newUser.id.toString());
    final response = await http.put(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': newUser.id.toString(),
      'name': newUser.name,
      'surname': newUser.lastName,
      'identification': newUser.identification,
      'email': newUser.email,
      'password': newUser.password,
      'phoneNumber': newUser.phone,
      'role': newUser.role,
      'genre': newUser.genre,
      'birthDate': newUser.birthDate,
      'typeStudent': newUser.typeStudent,
      'webPage': newUser.webPage,
    }),
    ).timeout(Duration(seconds: 10));    

    var urlUser = Uri.parse(baseLocalhost + 'flutter/getprofile');
    final responseUser = await http.post(urlUser,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': newUser.id.toString(),
      'role': newUser.role
    }),
    ).timeout(Duration(seconds: 50));
    String bodyUser = utf8.decode(responseUser.bodyBytes);
    final jsonData = jsonDecode(bodyUser); 

    if(response.statusCode == 200){ 
      User getNewUserChanged = User.fromJson(jsonData);
      context.read<UserCubit>().createUser(getNewUserChanged);
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultRegisterTitle,
            message: textGetUserSuccess,
            buttonAccept: BounceButton(
              iconLeft: Icons.save,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => BodyScaffold(getNewUserChanged))));
              },
            ),
          )
      );      
      return getNewUserChanged; 
    }else if(response.statusCode == 404){
      log(logGetUserFailed + "Error Not Found 404.");
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textResultCreateJobOffer,
            message: bodyUser, 
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogRegister,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Home())));
              },
            ),
          )
      );
    }else{
      log(logGetUserFailed);
    }    
    return newUser;    
  }

  void deleteUser(User user, BuildContext context) async{
    var url = Uri.parse(baseLocalhost + 'flutter/deleteuser');    
    final response = await http.delete(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': user.id.toString(),
      'role': user.role
    }),
    ).timeout(Duration(seconds: 10));
    String body = utf8.decode(response.bodyBytes); 

    if(response.statusCode == 200){ 
      context.read<UserCubit>().logout();
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultRegisterTitle,
            message: body,
            buttonAccept: BounceButton(
              iconLeft: Icons.save,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Home())));
              },
            ),
          )
      );
    }else if(response.statusCode == 404){
      log(logDeleteProfileUserFailed + "Error Not Found 404.");
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textResultCreateJobOffer,
            message: body, 
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogRegister,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => BodyProfileUserDrawer())));
              },
            ),
          )
      );
    }else{
      log(logDeleteProfileUserFailed);
    }
  }
}