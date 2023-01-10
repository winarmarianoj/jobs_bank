import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/home/home.dart';
import 'package:jobs_bank/screens/publisher/published.dart';
import 'package:jobs_bank/screens/utn/utn.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class JobOfferService {
  Future<JobOffer?> createJobOffer(User user, BuildContext context, PublishFormProvider publishForm) async{
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/' + user.id.toString());
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': publishForm.title,
      'description': publishForm.description,
      'area': publishForm.area,
      'body': publishForm.body,
      'experience': publishForm.experience,
      'modality': publishForm.modality,
      'position': publishForm.position,
      'category': publishForm.category,
    }),
    ).timeout(Duration(seconds: 100));
    
    if(response.statusCode == 201){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      JobOffer jobOffer = JobOffer.fromJson(jsonData);
      jobOffer.resultCreate = true;
      showDialog(context: context, 
        builder: (_) => CustomPopup(
          title: textResultCreateJobOffer,
          message: jobOffer.message,
          buttonAccept: BounceButton(
            iconLeft: Icons.save,
            buttonSize: ButtonSize.small,
            type: ButtonType.primary,
            label: textButtonShowDialogRegister,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Published()))); 
            },
          ),
        )
      );        
      return jobOffer;
    }else{
      log(logErrorCreateJobOffer);
      showDialog(context: context, 
        builder: (_) => CustomPopup(
          title: textResultCreateJobOffer,
          message: logErrorCreateJobOffer,
          buttonAccept: BounceButton(
            iconLeft: Icons.error,
            buttonSize: ButtonSize.small,
            type: ButtonType.primary,
            label: textButtonShowDialogRegister,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      );       
    }
    return null;
  }

  Future<List<JobOffer>?> bringsJobOfferList(Uri url, BuildContext context) async{
    List<JobOffer> joboffers = [];    
    final response = await http.get(url).timeout(Duration(seconds: 100));
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    if(response.statusCode == 200){       
      for (var item in jsonData){
        joboffers.add(JobOffer.fromJson(item));
      }      
    }else if(response.statusCode == 404){
      log(logJobOfferApplicantFailed + "Error Not Found 404.");
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textResultCreateJobOffer,
            message: body, 
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogRegister,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      );
    }else{
      log(logJobOfferAllFailed);
    }

    if(joboffers.isEmpty){
      log(logJobOffersIsEmpty);
      showDialog(context: context, 
          builder: (_) => CustomPopup(
              title: textResultCreateJobOffer,
              message: logJobOffersIsEmpty,
              buttonAccept: BounceButton(
                iconLeft: Icons.hourglass_empty,
                buttonSize: ButtonSize.small,
                type: ButtonType.primary,
                label: textButtonShowDialogRegister,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
        );
    }else{
      return joboffers;
    }
  }

  Future<List<JobOffer>?> getJobOfferAll(BuildContext context) async{
    return bringsJobOfferList(Uri.parse('http://10.0.2.2:8082/joboffer/'), context);
  }

  Future<List<JobOffer>?> getJobOfferPending(BuildContext context) async{
    return bringsJobOfferList(Uri.parse('http://10.0.2.2:8082/joboffer/pending'), context);    
  }

  Future<List<JobOffer>?> getAllPublishedJobOffers(BuildContext context) async{
    return bringsJobOfferList(Uri.parse('http://10.0.2.2:8082/joboffer/published-all'), context);    
  }

  Future<JobOffer?> jobOfferEvaluation(String selectedState, JobOffer jobOffer, BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/evaluation');
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': jobOffer.id.toString(),
      'decision': selectedState,
    }),
    ).timeout(Duration(seconds: 100));

    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);    

    if(response.statusCode == 200){      
      JobOffer jobOffer = JobOffer.fromJson(jsonData);      
      showDialog(context: context, 
        builder: (_) => CustomPopup(
          title: textResultCreateJobOffer,
          message: jobOffer.message,
          buttonAccept: BounceButton(
            iconLeft: Icons.save,
            buttonSize: ButtonSize.small,
            type: ButtonType.primary,
            label: textButtonShowDialogRegister,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => Utn()))); 
            },
          ),
        )
      );        
      return jobOffer;
    }else{
      log(logJobOfferEvaluationFailed);
      showDialog(context: context, 
        builder: (_) => CustomPopup(
          title: textResultCreateJobOffer,
          message: body,
          buttonAccept: BounceButton(
            iconLeft: Icons.error,
            buttonSize: ButtonSize.small,
            type: ButtonType.primary,
            label: textButtonShowDialogRegister,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      );       
    }
    return null;
  }
  

}



