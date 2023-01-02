import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_bank/screens/applicant/applicant.dart';
import 'package:jobs_bank/screens/applicant/applied.dart';

final pageRoutesApplicant = <_Route>[
  _Route( FontAwesomeIcons.house , 'Applicant',  Applicant() ),
  _Route( FontAwesomeIcons.forward , 'Applied',  Applied() ),
  //_Route( FontAwesomeIcons.truckPickup , 'Vans',  HomeVan() ),
  //_Route( FontAwesomeIcons.user , 'Profile', ProfileUser() ),
];
final pageRoutesPublisher = <_Route>[
  //_Route( FontAwesomeIcons.truck , 'Trucks',  HomeTruck() ),
  //_Route( FontAwesomeIcons.car , 'Cars',  HomeCar() ),
  //_Route( FontAwesomeIcons.truckPickup , 'Vans',  HomeVan() ),
  //_Route( FontAwesomeIcons.user , 'Profile', ProfileUser() ),
];
final pageRoutesUtn = <_Route>[
  //_Route( FontAwesomeIcons.truck , 'Trucks',  HomeTruck() ),
  //_Route( FontAwesomeIcons.car , 'Cars',  HomeCar() ),
  //_Route( FontAwesomeIcons.truckPickup , 'Vans',  HomeVan() ),
  //_Route( FontAwesomeIcons.user , 'Profile', ProfileUser() ),
];
//var roles = <String>["ADMIN", "APPLICANT", "PUBLISHER", "UTN"];
class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}