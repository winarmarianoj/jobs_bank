import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/publisher/decorations/decorationPublishForm.dart';
import 'package:jobs_bank/screens/publisher/publish.dart';
import 'package:jobs_bank/service/jobOfferService.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:provider/provider.dart';

class PublishForm extends StatefulWidget {
  final User user;
  const PublishForm({Key? key, required this.user}) : super(key: key);  

  @override
  State<PublishForm> createState() => _PublishFormState(user: user);
}

class _PublishFormState extends State<PublishForm> {
  final User user;
  _PublishFormState({Key? key, required this.user});  

  String selectedModality = '';
  String selectedPosition = '';
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    final publishForm = Provider.of<PublishFormProvider>(context);    
    return Container(
      child: Form(
        key: publishForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(           
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: DecorationPublishForm.inputDecoration(
                  hintText: hintTextTitle,
                  labelText: labelTextTitle,
                  prefixIcon: Icons.title),
              onChanged: (value) => publishForm.title = value,
              validator: (value) {
                String pattern = textRegexPattern;
                RegExp regExp = RegExp(pattern);
                bool reg = regExp.hasMatch(value ?? '')
                    ? true
                    : false;
                return (reg && value != null && value.length <= 30)
                    ? null
                    : invalidFormatTitle;
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: DecorationPublishForm.inputDecoration(
                  hintText: hintTextDescription,
                  labelText: labelTextDescription,
                  prefixIcon: Icons.description),
              onChanged: (value) => publishForm.description = value,
              validator: (value) {
                String pattern = textAndNumberRegexPattern;
                RegExp regExp = RegExp(pattern);
                bool reg = regExp.hasMatch(value ?? '')
                    ? true
                    : false;
                return (reg && value != null && value.length <= 50)
                    ? null
                    : invalidFormatDescription;
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: DecorationPublishForm.inputDecoration(
                  hintText: hintTextArea,
                  labelText: labelTextArea,
                  prefixIcon: Icons.area_chart),
              onChanged: (value) => publishForm.area = value,
              validator: (value) {
                String pattern = textRegexPattern;
                RegExp regExp = new RegExp(pattern);
                bool reg = regExp.hasMatch(value ?? '')
                    ? true
                    : false;
                return (reg && value != null && value.length <= 15)
                    ? null
                    : invalidFormatArea;
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: DecorationPublishForm.inputDecoration(
                  hintText: hintTextBody,
                  labelText: labelTextBody,
                  prefixIcon: Icons.book),
              onChanged: (value) => publishForm.body = value,
              validator: (value) {
                String pattern = textAndNumberRegexPattern;
                RegExp regExp = new RegExp(pattern);
                bool reg = regExp.hasMatch(value ?? '')
                    ? true
                    : false;
                return (reg && value != null && value.length <= 100)
                    ? null
                    : invalidFormatBody;
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: DecorationPublishForm.inputDecoration(
                  hintText: hintNumberExperience,
                  labelText: labelNumberExperience,
                  prefixIcon: Icons.work_history),
              onChanged: (value) => publishForm.experience = value,
              validator: (value) {
                String pattern = numberRegexPattern;
                RegExp regExp = new RegExp(pattern);
                bool reg = regExp.hasMatch(value ?? '')
                    ? true
                    : false;
                return (reg && value != null && value.length <= 50)
                    ? null
                    : invalidFormtaExperience;
              },
            ),
            DropdownButtonFormField(
              items: <String>['ONSITE', 'REMOTE', 'MIXED'].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: MyText(text: textSelectedModality),
              onSaved: (value) {
                setState(() {
                  selectedModality = value!;
                });
              }, 
              onChanged: (value) {
                setState(() {
                  selectedModality = value!;
                  publishForm.modality = value;
                });
              },
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField(
              items: <String>['FULLTIME', 'PARTTIME', 'CONTRACT'].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: MyText(text: textSelectedPosition),
              onSaved: (value) {
                setState(() {
                  selectedPosition = value!;
                });
              }, 
              onChanged: (value) {
                setState(() {
                  selectedPosition = value!;
                  publishForm.position = value;
                });
              },
            ),
            const SizedBox(height: 5),          
            DropdownButtonFormField(
              items: <String>['FULLSTACK', 'BACKEND', 'FRONTEND', 'QA', 'UI-UX'].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: MyText(text: textSelectedCategory),
              onSaved: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              }, 
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  publishForm.category = value;
                });
              },
            ),
            const SizedBox(height: 5),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: themePublishFormDisableButton,
              elevation: 0,
              color: themePublishFormSendButton,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80,
                   vertical: 5),
                  child: Text(
                    user.isConected ? 'Procesando....': 'Enviar' ,                     
                    style: const TextStyle(color: themePublishFormStateProccess),
                  )), 
              onPressed: publishForm.isLoading && publishForm.title.length!=0 && publishForm.description.length!=0
                  ? null
                  : () {
                      FocusScope.of(context).unfocus();
                      if (!publishForm.isValidForm()) return;
                      Future.delayed(Duration(seconds: 5));
                      JobOfferService jobOfferService = JobOfferService();
                      jobOfferService.createJobOffer(user, context, publishForm);                    
                    }
            ),
          ],
        ),
      ),
    );
  }
}