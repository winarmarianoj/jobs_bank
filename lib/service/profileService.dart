import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/home/home.dart';
import 'package:jobs_bank/screens/publisher/publisher.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';
import 'package:jobs_bank/widgets/userActive/bodyHomeDrawer.dart';
import 'package:jobs_bank/widgets/userActive/bodyProfileDrawer.dart';

class ProfileService {
  Future<User?> changeUser(User newUser, BuildContext context) async{
    final userCubit = context.read<UserCubit>();  
    var url = Uri.parse('http://10.0.2.2:8082/person/' + newUser.id.toString());
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

    var urlUser = Uri.parse('http://10.0.2.2:8082/flutter/' + newUser.id.toString());
    final responseUser = await http.get(urlUser,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },).timeout(Duration(seconds: 50));
    String bodyUser = utf8.decode(responseUser.bodyBytes);
    final jsonData = jsonDecode(bodyUser); 

    if(response.statusCode == 200){ 
      User getNewUserChanged = User.fromJson(jsonData);
      userCubit.createUser(getNewUserChanged);
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Home())));
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
    var url = Uri.parse('http://10.0.2.2:8082/person/' + user.id.toString());    
    final response = await http.delete(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },    
    ).timeout(Duration(seconds: 10));
    String body = utf8.decode(response.bodyBytes); 

    if(response.statusCode == 200){         
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) => BodyHomeDrawer())));
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