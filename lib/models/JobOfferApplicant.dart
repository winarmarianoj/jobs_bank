import 'package:flutter/material.dart';

class JobOfferApplicant {
  String applied, deletedDay, name, surname,
  dni, email, phoneNumber, typeStudent,
  title, description, area, body, experience, modality, 
  position, category, categoryDescription, 
  datePublished, modifiedDay, jobOfferDeletedDay, 
  message, state;
  final int jobOfferApplicantID, applicantID, jobOfferID;
  final bool? jobAppdeleted, jobOfferDeleted;

  JobOfferApplicant({
    required this.jobOfferApplicantID,
    required this.applied,
    required this.deletedDay,
    required this.applicantID,
    required this.name,
    required this.surname,
    required this.dni,
    required this.email,
    required this.phoneNumber,
    required this.typeStudent,
    required this.jobOfferID,
    required this.title,
    required this.description,
    required this.area,
    required this.body,
    required this.experience,
    required this.modality,
    required this.position,
    required this.category,
    required this.categoryDescription,
    required this.datePublished,
    required this.modifiedDay,
    required this.jobOfferDeletedDay,
    required this.message,
    required this.state,    
    this.jobAppdeleted,
    this.jobOfferDeleted,
  });
  
  factory JobOfferApplicant.fromJson(Map<String, dynamic> json) {    
    return JobOfferApplicant(jobOfferApplicantID: json["jobOfferApplicantID"], 
          applied: json["applied"], deletedDay: json["deletedDay"], 
          applicantID: json["applicantID"], name: json["name"], surname: json["surname"], 
          dni: json["dni"], email: json["email"], phoneNumber: json["phoneNumber"], 
          typeStudent: json["typeStudent"], jobOfferID: json["jobOfferID"], 
          title: json["title"], description: json["description"], area: json["area"], 
          body: json["body"], experience: json["experience"], modality: json["modality"], 
          position: json["position"], category: json["category"], 
          categoryDescription: json["categoryDescription"], datePublished: json["datePublished"], 
          modifiedDay: json["modifiedDay"], jobOfferDeletedDay: json["jobOfferDeletedDay"], 
          message: json["message"], state: json["state"]);
  }
  
}