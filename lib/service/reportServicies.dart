import 'dart:convert';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';

class ReportService {

  Future<List<JobOfferApplicant>> getJobOfferApplied(User user) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/applied/' + user.id.toString());
    List<JobOfferApplicant> jobOfferApp = [];    
    final response = await http.get(url).timeout(Duration(seconds: 10));;
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData){
        jobOfferApp.add(
          JobOfferApplicant(jobOfferApplicantID: item["jobOfferApplicantID"], applied: item["applied"], 
          deletedDay: item["deletedDay"], applicantID: item["applicantID"], 
          name: item["name"], surname: item["surname"], 
          dni: item["dni"], email: item["email"], 
          phoneNumber: item["phoneNumber"], typeStudent: item["typeStudent"], 
          jobOfferID: item["jobOfferID"], title: item["title"], 
          description: item["description"], area: item["area"], 
          body: item["body"], experience: item["experience"], 
          modality: item["modality"], position: item["position"], 
          category: item["category"], categoryDescription: item["categoryDescription"], 
          datePublished: item["datePublished"], modifiedDay: item["modifiedDay"], 
          jobOfferDeletedDay: item["jobOfferDeletedDay"], state: item["state"]));
      }
      return jobOfferApp;
    }else{
      throw Exception("Fallo traer la lista de jobOfferApp");
    }
  }

  /* Future<List<JobOffer>> getJobOfferPublished(LoginFormProvider loginForm) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/publisher/'+loginForm.id.toString());
    List<JobOffer> joboffers = [];    
    final response = await http.get(url).timeout(Duration(seconds: 10));;
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData){
        joboffers.add(
          JobOffer(id: item["id"], title: item["title"], description: item["description"], area: item["area"], 
          experience: item["experience"], modality: item["modality"], 
          position: item["position"], category: item["category"], body: item["body"], 
          datePublished: item["datePublished"], deleted: item["deleted"], deletedDay: item["deletedDay"], 
          message: item["message"], modifiedDay: item["modifiedDay"], state: item["state"]));
      }
      return joboffers;
    }else{
      throw Exception("Fallo traer la lista de Joboffers");
    }    
  }

  Future<List<JobOfferApplication>> getAllAppliedByJobOffer(int jobOfferID, LoginFormProvider loginForm) async{
    var url = Uri.parse('http://10.0.2.2:8082/flutter/jobapplicants-by-my-offers/'+jobOfferID.toString());
    List<JobOfferApplication> jobOfferApp = [];    
    final response = await http.get(url).timeout(Duration(seconds: 10));;
    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData){
        jobOfferApp.add(
          JobOfferApplication(jobOfferApplicantID: item["jobOfferApplicantID"], applied: item["applied"], 
          deletedDay: item["deletedDay"], applicantID: item["applicantID"], 
          name: item["name"], surname: item["surname"], 
          dni: item["dni"], email: item["email"], 
          phoneNumber: item["phoneNumber"], typeStudent: item["typeStudent"], 
          jobOfferID: item["jobOfferID"], title: item["title"], 
          description: item["description"], area: item["area"], 
          body: item["body"], experience: item["experience"], 
          modality: item["modality"], position: item["position"], 
          category: item["category"], categoryDescription: item["categoryDescription"], 
          datePublished: item["datePublished"], modifiedDay: item["modifiedDay"], 
          jobOfferDeletedDay: item["jobOfferDeletedDay"], state: item["state"]));
      }
      return jobOfferApp;
    }else{
      throw Exception("Fallo traer la lista de jobOfferApp");
    }
  } */
  

}