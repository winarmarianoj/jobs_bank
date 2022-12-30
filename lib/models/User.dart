import 'package:flutter/material.dart';
import 'package:jobs_bank/models/Contact.dart';

class User {  
  final int id;
  final String name, lastName, phone, email, password, role, jwt;
  final List<Contact> contacts;

  User({ required this.id, required this.name, required this.lastName,
  required this.phone, required this.email, required this.password,
  required this.role, required this.jwt, required this.contacts});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  User copyWith({ 
    String? name, lastName, phone, email, password, role, jwt,
    int? id,
    List<Contact>? contacts, 
  }) =>
    User(
    id: id?? this.id,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    role: role ?? this.role,
    jwt: jwt ?? this.jwt,
    password: password ?? this.password,
    contacts: contacts ?? this.contacts,
  );
}


