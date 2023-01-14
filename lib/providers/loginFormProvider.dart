import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String email = '';
  String passwordOne = '';
  String passwordTwo = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$email - $passwordOne - $passwordTwo');

    return formKey.currentState?.validate() ?? false;
  }
}
