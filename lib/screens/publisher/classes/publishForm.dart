import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/widgets/joboffer/publishWidgets/areaWidget.dart';
import 'package:jobs_bank/widgets/joboffer/publishWidgets/bodyWidget.dart';
import 'package:jobs_bank/widgets/joboffer/publishWidgets/descriptionWidget.dart';
import 'package:jobs_bank/widgets/joboffer/publishWidgets/experienceWidget.dart';
import 'package:jobs_bank/widgets/joboffer/publishWidgets/titleWidget.dart';
import 'package:jobs_bank/service/jobOfferService.dart';
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
            TitleWidget(publishForm: publishForm, initialData: '',),
            DescriptionWidget(publishForm: publishForm, initialData: '',),
            AreaWidget(publishForm: publishForm, initialData: '',),
            BodyWidget(publishForm: publishForm, initialData: '',),
            ExperienceWidget(publishForm: publishForm, initialData: '',),
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
                    user.conected ? 'Procesando....': 'Enviar' ,                     
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
