import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/service/profileService.dart';
part 'userState.dart';

class UserCubit extends Cubit<UserState> {
  
  UserCubit() : super( UserInitial() );
  ProfileService profileService = ProfileService();
  
  void createUser( User user ) {
    emit( UserActive(user) );
  }

  void getUser(){
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith();
      return emit( UserActive( newUser ) );
    }
  }

  void changeName( String name, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( name: name );
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }
  void changeLastName( String lastName, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( lastName: lastName );
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }
  void changePhone( String phone, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( phone: phone );
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }
  void changeEmail( String email, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( email: email );
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }
  void changePassword( String password, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( password: password );
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }

  void changeIdentification(String newAttribute, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( identification: newAttribute);
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }

  void changeGenre(String newAttribute, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( genre: newAttribute);
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }

  void changeBirthDate(String newAttribute, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( birthDate: newAttribute);
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }

  void changeTypeStudent(String newAttribute, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( typeStudent: newAttribute);
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }

  void changeWebPage(String newAttribute, BuildContext context) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( webPage: newAttribute);
      profileService.changeUser(newUser, context);
      //emit( UserActive( newUser ) );
    }
  }

  void deleteUser(BuildContext context) { 
    final currentState = state;
    if ( currentState is UserActive ) {      
      final newUser = currentState.user.copyWith();
      log("estoy en userCubit delete y el user id es " + newUser.id.toString());
      profileService.deleteUser(newUser, context);
    }    
  }

  void logout() {
    emit(UserInitial());
  }

}
