import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/models/User.dart';
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

  void logout() {
    emit( UserInitial( ) );
  }

  void changeIdentification(String newAttribute) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( identification: newAttribute);
      emit( UserActive( newUser ) );
    }
  }

  void changeGenre(String newAttribute) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( genre: newAttribute);
      emit( UserActive( newUser ) );
    }
  }

  void changeBirthDate(String newAttribute) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( birthDate: newAttribute);
      emit( UserActive( newUser ) );
    }
  }

  void changeTypeStudent(String newAttribute) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( typeStudent: newAttribute);
      emit( UserActive( newUser ) );
    }
  }

  void changeWebPage(String newAttribute) {
    final currentState = state;
    if ( currentState is UserActive ) {
      final newUser = currentState.user.copyWith( webPage: newAttribute);
      emit( UserActive( newUser ) );
    }
  }

}
