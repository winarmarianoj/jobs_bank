import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/applicant/applicant.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class ApplicantService {
  final String baseHeroku = 'https://bolsadetrabajo.herokuapp.com/';
  final String baseLocalhost = 'http://localhost:8082/';
  final String baseLocal = 'http://10.0.2.2:8082/';

  Future<bool?> postulate(int jobOfferID, User user, BuildContext context) async{
    bool result = false;
    var url = Uri.parse(baseLocalhost + 'joboffer/postulate');
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset' : 'utf-8'
    },
    body: jsonEncode(<String, int>{
      'jobofferID': jobOfferID,
      'applicantID': user.id,
    }),
    ).timeout(Duration(seconds: 60));
    
    String body = utf8.decode(response.bodyBytes);
    if(response.statusCode == 202){      
      result = true;
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textLabelPostulateService,
            message: body, 
            buttonAccept: BounceButton(
              iconLeft: Icons.save,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Applicant())));
              },
            ),
          )
      );  
    }else{      
      log(logPostulateFailedApplicantService);
      showDialog(
        context: context, 
        builder: (_) => CustomPopup(
            title: textLabelPostulateService,
            message: body,
            buttonAccept: BounceButton(
              iconLeft: Icons.error,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Applicant())));
              },
            ),
          )
      );  
    }
    return result;    
  }

    

}