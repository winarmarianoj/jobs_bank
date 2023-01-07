import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/screens/welcome/headerPage.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class AuthenticationService {
  Future<LoginFormProvider?> getLoginUser(LoginFormProvider loginForm, BuildContext context) async{    
    final userCubit = context.read<UserCubit>(); 
    var url = Uri.parse('http://10.0.2.2:8082/auth/loginflutter');
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': loginForm.email,
      'password': loginForm.password,
    }),
    ).timeout(Duration(seconds: 10));   
    String body = utf8.decode(response.bodyBytes);

    if(response.statusCode == 200){           
      loginForm.isLoading = true;      
      User newUser = getNewUser(body);
      userCubit.createUser(newUser);      
      Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage(user: newUser,))));
    }else{
      log(logLoginFailedAuthenticationService);
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultErrorLoginTitle,
            message: body + textResultInvalidDataLogin,
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      );  
    }
    return loginForm;
  }

  Future<RegisterFormProvider?> registerApplicant(RegisterFormProvider register, BuildContext context) async{
    final userCubit = context.read<UserCubit>();  
    var url = Uri.parse('http://10.0.2.2:8082/applicant/');
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': register.name,
      'surname': register.surname,
      'identification': register.identification,
      'email': register.email,
      'password': register.password,
      'phoneNumber': register.phoneNumber,
      'role': 'APPLICANT',
      'genre': register.genre,
      'birthDate': register.birthDate,
      'typeStudent': register.typeStudent,
    }),
    ).timeout(Duration(seconds: 10));

    String body = utf8.decode(response.bodyBytes); 
    final jsonData = jsonDecode(body);
    if(response.statusCode == 201){           
      register.isLoading = true;
      User newUser = getNewUser(body);
      userCubit.createUser(newUser);
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage(user: newUser,))));
              },
            ),
          )
      );      
    }else{
      log(logRegisterStudentAuthenticationService);
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultRegisterTitle,
            message: body,
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      );              
    }
    return register;    
  }

  Future<RegisterFormProvider?> registerPublisher(RegisterFormProvider register, BuildContext context) async{
    final userCubit = context.read<UserCubit>();
    var url = Uri.parse('http://10.0.2.2:8082/publisher/');
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': register.name,
      'surname': register.surname,
      'identification': register.identification,
      'email': register.email,
      'password': register.password,
      'phoneNumber': register.phoneNumber,
      'role': 'PUBLISHER',
      'webPage': register.webPage,
    }),
    ).timeout(Duration(seconds: 10));

    String body = utf8.decode(response.bodyBytes); 
    final jsonData = jsonDecode(body);
    if(response.statusCode == 201){    
      register.isLoading = true;
      User newUser = getNewUser(body);
      userCubit.createUser(newUser);
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) => HeadersPage(user: newUser,))));
              },
            ),
          )
      );
    }else{
      log(logRegisterPublisherAuthenticationService);
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultRegisterTitle,
            message: body,
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      );     
    }    
    return register;
  }

  User getNewUser(String body){
    final jsonData = jsonDecode(body);
    User user = User(id: jsonData['id'], name: jsonData['name'], lastName: jsonData['lastName'], 
    identification: jsonData['identification'], phone: jsonData['phone'], email: jsonData['username'], 
    password: jsonData['password'], role: jsonData['role'], jwt: jsonData['jwt'], 
    genre: jsonData['genre'], birthDate: jsonData['birthDate'], typeStudent: jsonData['typeStudent'],
    webPage: jsonData['webPage']);
    user.isConected = true;
    log(user.name + " " + user.lastName + " " + user.role + " con id " + user.id.toString() + " esta todo bien");
    return user;
  }  

}



