import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/publisher/published.dart';
import 'package:jobs_bank/screens/publisher/publisher.dart';
import 'package:jobs_bank/screens/utn/utn.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class JobOfferListService{
  Future<List<JobOffer>?> getJobOfferAll(BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/');
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

  Future<List<JobOffer>?> getJobOfferPending(BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/pending');
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

  Future<List<JobOffer>?> getAllPublishedJobOffers(BuildContext context) async{
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/published-all');
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
      /* showDialog(context: context, 
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
        ); */
    }else{
      return joboffers;
    }
  }


}