import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String email = '';
  String password = '';
  String role = '';
  String jwt = '';
  int id = 0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$email - $password - $role - ·$id');

    return formKey.currentState?.validate() ?? false;
  }
}
