import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
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

class JobOfferModify extends StatefulWidget {
  final User user;
  final JobOffer jobOffer;
  const JobOfferModify({Key? key, required this.user, required this.jobOffer,}) : super(key: key);  

  @override
  State<JobOfferModify> createState() => _JobOfferModifyState(user: user, jobOffer: jobOffer,);
}

class _JobOfferModifyState extends State<JobOfferModify> {
  final User user;
  final JobOffer jobOffer;
  _JobOfferModifyState({Key? key, required this.user, required this.jobOffer,});  

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
            TitleWidget(publishForm: publishForm, initialData: jobOffer.title,),
            DescriptionWidget(publishForm: publishForm, initialData: jobOffer.description,),
            AreaWidget(publishForm: publishForm, initialData: jobOffer.area,),
            BodyWidget(publishForm: publishForm, initialData: jobOffer.body,),
            ExperienceWidget(publishForm: publishForm, initialData: jobOffer.experience,),
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
                      publishForm.id = jobOffer.id.toString();
                      jobOfferService.modifyJobOffer(user, context, publishForm);                    
                    }
            ),
          ],
        ),
      ),
    );
  }
}
