part of 'userCubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {
  final isExistsUser = false;
}

class UserActive extends UserState {
  final isExistsUser = true;
  final User user;

  UserActive(this.user);

}

