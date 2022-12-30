import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  String name = '';
  String surname = '';
  String identification = '';
  String email = '';
  String password = '';
  String phoneNumber = '';  
  String role = '';
  String genre = '';
  String birthDate = '';
  String typeStudent = '';
  String webPage = '';


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$name - $surname - $email - $password - $phoneNumber - $identification');

    return formKey.currentState?.validate() ?? false;
  }
}
