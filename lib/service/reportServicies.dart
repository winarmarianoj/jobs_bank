import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/applicant/applicant.dart';
import 'package:jobs_bank/screens/publisher/publisher.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class ReportService {

  Future<List<JobOfferApplicant>?> getJobOfferApplied(User user, BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/applied/' + user.id.toString());
    List<JobOfferApplicant> jobOfferAppList = [];    
    final response = await http.get(url).timeout(Duration(seconds: 10));
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    if(response.statusCode == 200){      
      for (var item in jsonData){
        jobOfferAppList.add(JobOfferApplicant.fromJson(item));
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
      log(logJobOfferApplicantFailed);
    }
    if(jobOfferAppList.isEmpty){
      log(logJOAppFailedBodyJOApplicant);
      showDialog(context: context, 
          builder: (_) => CustomPopup(
              title: textResultCreateJobOffer,
              message: logJOAPPListIsEmptyApplied,
              buttonAccept: BounceButton(
                iconLeft: Icons.hourglass_empty,
                buttonSize: ButtonSize.small,
                type: ButtonType.primary,
                label: textButtonShowDialogRegister,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Applicant())));
                },
              ),
            )
        );
    }else{
      return jobOfferAppList;
    }
  }

  Future<List<JobOffer>?> getJobOfferPublished(User user, BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/publisher/'+user.id.toString());
    List<JobOffer> joboffers = [];    
    final response = await http.get(url).timeout(Duration(seconds: 10));
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
            message: jsonData, // logJobOfferApplicantFailed,
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
      log(logJobOfferFailedBodyPublished);
    }
    if(joboffers.isEmpty){
      log(logJOAppFailedBodyJOApplicant);
      showDialog(context: context, 
          builder: (_) => CustomPopup(
              title: textResultCreateJobOffer,
              message: logJobOfferListEmpty,
              buttonAccept: BounceButton(
                iconLeft: Icons.hourglass_empty,
                buttonSize: ButtonSize.small,
                type: ButtonType.primary,
                label: textButtonShowDialogRegister,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Publisher())));
                },
              ),
            )
        );
    }else{
      return joboffers;
    }
  }

  Future<List<JobOfferApplicant>?> getAllAppliedByJobOffer(int jobOfferID, BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/jobapplicants-by-my-offers/'+jobOfferID.toString());
    List<JobOfferApplicant> jobOfferApp = [];    
    final response = await http.get(url).timeout(Duration(seconds: 10));
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    if(response.statusCode == 200){      
      for (var item in jsonData){
        jobOfferApp.add(JobOfferApplicant.fromJson(item));
      }      
    }else if(response.statusCode == 404){
      log(logJobOfferApplicantFailed + "Error Not Found 404.");
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textResultCreateJobOffer,
            message: jsonData, // logJobOfferApplicantFailed,
            buttonAccept: BounceButton(
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
      log(logJobOfferAppFailedBodySubscribed);
    }
    if(jobOfferApp.isEmpty){
      log(logJOAppFailedBodyJOApplicant);
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textResultCreateJobOffer,
            message: logJOAPPListIsEmpty,
            buttonAccept: BounceButton(
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogRegister,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Publisher())));
              },
            ),
          )
      );
    }else{
      return jobOfferApp;
    }
  } 
  

}