import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/models/User.dart';

import '../models/Contact.dart';
part 'userState.dart';

class UserCubit extends Cubit<UserState> {
  
  UserCubit() : super( UserInitial() );
  
  void createUser( User user ) {
    emit( UserActive(user) );
  }

  void changeName( String name ) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( name: name );
      emit( UserActive( newUser ) );
    }
  }
  void changeLastName( String lastName ) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( lastName: lastName );
      emit( UserActive( newUser ) );
    }
  }
  void changePhone( String phone ) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( phone: phone );
      emit( UserActive( newUser ) );
    }
  }
  void changeEmail( String email ) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( email: email );
      emit( UserActive( newUser ) );
    }
  }
  void changePassword( String password ) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( password: password );
      emit( UserActive( newUser ) );
    }
  }

  void addContact(Contact contact) {
    final currentState = state;
    if ( currentState is UserActive ) {      
      final newContacts = [
        ...currentState.user.contacts,
        contact,
      ];
      
      final newUser = currentState.user.copyWith( contacts:  newContacts);
      emit( UserActive( newUser ) );
    }
  }

  void logout() {
    emit( UserInitial( ) );
  }

}
