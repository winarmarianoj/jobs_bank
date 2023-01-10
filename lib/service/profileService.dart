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
  Future<User?> getUser(User newUser, BuildContext context) async{
    final userCubit = context.read<UserCubit>();  
    var url = Uri.parse('http://10.0.2.2:8082/flutter/' + newUser.id.toString());
    final response = await http.get(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },).timeout(Duration(seconds: 50));
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body); 

    if(response.statusCode == 200){ 
      User getNewUserChanged = getNewUser(body);
      userCubit.createUser(getNewUserChanged);
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultRegisterTitle,
            message: jsonData["message"],
            buttonAccept: BounceButton(
              iconLeft: Icons.save,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => BodyProfileUserDrawer())));
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
      log(logGetUserFailed);
    }
    return newUser;    
  }

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

    String body = utf8.decode(response.bodyBytes);

    var urlUser = Uri.parse('http://10.0.2.2:8082/flutter/' + newUser.id.toString());
    final responseUser = await http.get(urlUser,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },).timeout(Duration(seconds: 50));
    String bodyUser = utf8.decode(responseUser.bodyBytes);
    final jsonData = jsonDecode(bodyUser); 

    if(response.statusCode == 200){ 
      User getNewUserChanged = getNewUser(bodyUser);
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
    log("Estoy en profile service en delete function y el user id es " + user.id.toString());
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
    }else if(response.statusCode == 406){
      log(logDeleteProfileUserFailed + "Error Not Found 406.");
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

  User getNewUser(String body){
    final jsonData = jsonDecode(body);
    User user = User(id: jsonData['id'], name: jsonData['name'], lastName: jsonData['lastName'], 
    identification: jsonData['identification'], phone: jsonData['phone'], email: jsonData['username'], 
    password: 'Developer\$2023', role: jsonData['role'], jwt: jsonData['jwt'], 
    genre: jsonData['genre'], birthDate: jsonData['birthDate'], typeStudent: jsonData['typeStudent'],
    webPage: jsonData['webPage'], conected: jsonData['conected']);
    log(user.name + " " + user.lastName + " " + user.role + " con id " + user.id.toString() + " esta todo bien");
    return user;
  }  

}