import 'package:flutter/material.dart';

class JobOffer {
  final String title, description, area, experience, modality, position, category, body,
  datePublished, modifiedDay, deletedDay, message, state;
  final int id;
  final bool? deleted;

  JobOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.area,
    required this.body,
    required this.experience,
    required this.modality,
    required this.position,
    required this.category,
    required this.datePublished,
    required this.modifiedDay,
    required this.deletedDay,
    required this.deleted,
    required this.state,
    required this.message,
  });
  
  factory JobOffer.fromJson(Map<String, dynamic> json) {    
    return JobOffer(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        area: json['area'],
        body: json['body'],
        experience: json['experience'],        
        modality: json['modality'],
        position: json['position'],
        category: json['category'],
        datePublished: json['datePublished'],
        modifiedDay: json['modifiedDay'],
        deletedDay: json['deletedDay'],
        deleted: json['deleted'],
        state: json['state'],
        message: json['message']);
  }
}