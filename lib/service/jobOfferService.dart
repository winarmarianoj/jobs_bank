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
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    
    if(response.statusCode == 201){      
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
          message: logErrorCreateJobOffer + "" + body,
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

  

  Future<JobOffer?> modifyJobOffer(User user, BuildContext context, PublishFormProvider publishForm) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/joboffer');
    final response = await http.put(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id': publishForm.id,
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
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);
    
    if(response.statusCode == 201){      
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
          message: logErrorCreateJobOffer + "" + body,
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

  void deleteJobOffer(JobOffer jobOffer, BuildContext context) async{    
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/' + jobOffer.id.toString());    
    final response = await http.delete(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },    
    ).timeout(Duration(seconds: 10));
    String body = utf8.decode(response.bodyBytes); 

    if(response.statusCode == 200){         
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textResultCreateJobOffer,
            message: body,
            buttonAccept: BounceButton(
              iconLeft: Icons.save,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Publisher())));
              },
            ),
          )
      );
    }else if(response.statusCode == 404){
      log(logJobOfferDeleteFailed + "Error Not Found 404." + " " + body);
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
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Publisher())));
              },
            ),
          )
      );
    }else{
      log(logJobOfferDeleteFailed);
    }
  }  

  
}



