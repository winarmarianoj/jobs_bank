import 'package:flutter/material.dart';

class JobOfferApplication {
  String applied, deletedDay, name, surname,
  dni, email, phoneNumber, typeStudent,
  title, description, area, body, experience, modality, 
  position, category, categoryDescription, 
  datePublished, modifiedDay, jobOfferDeletedDay, 
  state;
  final int jobOfferApplicantID, applicantID, jobOfferID;
  final bool? jobAppdeleted, jobOfferDeleted;

  JobOfferApplication({
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
    required this.state,    
    this.jobAppdeleted,
    this.jobOfferDeleted,
  });
  
  
}