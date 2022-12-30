import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/loginFormProvider.dart';
import 'package:jobs_bank/providers/registerFormProvider.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class AuthenticationService {
  Future<LoginFormProvider?> getLoginUser(LoginFormProvider loginForm, BuildContext context) async{    
    final usuarioCubit = context.read<UserCubit>();  
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

    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);      
      loginForm.isLoading = true;
      User newUser = getNewUser(body);
      usuarioCubit.createUser(newUser);
    }else{
      print("Fallo traer la lista de Joboffers");      
    }
    return loginForm;
  }

  Future<RegisterFormProvider?> registerApplicant(RegisterFormProvider register, BuildContext context) async{
    final usuarioCubit = context.read<UserCubit>();  
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

    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);      
      register.isLoading = true;
      User newUser = getNewUser(body);
      usuarioCubit.createUser(newUser);
    }else{
      print("Fallo el registro del estudiante.");       
    }
    return register;    
  }

  Future<RegisterFormProvider?> registerPublisher(RegisterFormProvider register, BuildContext context) async{
    final usuarioCubit = context.read<UserCubit>();
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

    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      register.isLoading = true;
      User newUser = getNewUser(body);
      usuarioCubit.createUser(newUser);
    }else{
      print("Fallo el registro del publicador.");   
    }    
    return register;
  }

  User getNewUser(String body){
    final jsonData = jsonDecode(body);
    User user = User(id: jsonData['id'], name: jsonData['name'], lastName: jsonData['lastName'], 
    phone: jsonData['phone'], email: jsonData['username'], password: jsonData['password'],
    role: jsonData['role'], jwt: jsonData['jwt'], contacts: []);
    user.isLoading = true;
    return user;
  }
  

}



