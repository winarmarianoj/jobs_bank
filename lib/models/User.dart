import 'package:flutter/material.dart';
import 'package:jobs_bank/models/Contact.dart';

class User {  
  final int id;
  final String name, lastName, identification, phone, email, password, role, jwt,
  genre, birthDate, typeStudent, webPage;
  final bool conected;

  User({ required this.id, required this.name, required this.lastName, required this.identification,
  required this.phone, required this.email, required this.password, required this.genre, 
  required this.birthDate, required this.typeStudent, required this.webPage,
  required this.role, required this.jwt, required this.conected});

  User copyWith({ 
    String? name, lastName, identification, phone, email, password, role, jwt,
    genre, birthDate, typeStudent, webPage,
    int? id,
    bool? conected,
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
    conected: conected ?? this.conected,
  );
}


