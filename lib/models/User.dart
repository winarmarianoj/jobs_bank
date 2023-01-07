import 'package:flutter/material.dart';
import 'package:jobs_bank/models/Contact.dart';

/*
  String genre = '';
  String birthDate = '';
  String typeStudent = '';
  String webPage = '';
*/

class User {  
  final int id;
  final String name, lastName, identification, phone, email, password, role, jwt,
  genre, birthDate, typeStudent, webPage;

  User({ required this.id, required this.name, required this.lastName, required this.identification,
  required this.phone, required this.email, required this.password, required this.genre, 
  required this.birthDate, required this.typeStudent, required this.webPage,
  required this.role, required this.jwt});

  bool _isConected = false;
  bool get isConected => _isConected;

  set isConected(bool value) {
    _isConected = value;
  }

  User copyWith({ 
    String? name, lastName, identification, phone, email, password, role, jwt,
    genre, birthDate, typeStudent, webPage,
    int? id,
  }) =>
    User(
    id: id?? this.id,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    identification: identification ?? this.identification,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    jwt: jwt ?? this.jwt,
    genre: genre ?? this.genre,
    birthDate: birthDate ?? this.birthDate,
    typeStudent: typeStudent ?? this.typeStudent,
    webPage: webPage ?? this.webPage,
  );
}


