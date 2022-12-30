import 'package:flutter/material.dart';

class PublishFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  int id = 0;
  String title = '';
  String description = '';
  String area = '';
  String body = '';
  String experience = '';
  String modality = '';
  String position = '';
  String category = '';  

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    print('$title - $description - $area - ·$id');
    print('$body - $experience - $modality - ·$position - $category');

    return formKey.currentState?.validate() ?? false;
  }
}
