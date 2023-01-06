import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_bank/screens/applicant/applicant.dart';
import 'package:jobs_bank/screens/applicant/applied.dart';
import 'package:jobs_bank/screens/publisher/publish.dart';
import 'package:jobs_bank/screens/publisher/published.dart';
import 'package:jobs_bank/screens/publisher/publisher.dart';
import 'package:jobs_bank/screens/publisher/subscribed.dart';
import 'package:jobs_bank/screens/utn/evalutaion.dart';
import 'package:jobs_bank/screens/utn/utn.dart';

final pageRoutesApplicant = <_Route>[
  _Route( FontAwesomeIcons.house , 'Applicant',  Applicant() ),
  _Route( FontAwesomeIcons.forward , 'Applied',  Applied() ),
  //_Route( FontAwesomeIcons.truckPickup , 'Vans',  HomeVan() ),
  //_Route( FontAwesomeIcons.user , 'Profile', ProfileUser() ),
];
final pageRoutesPublisher = <_Route>[
  _Route( FontAwesomeIcons.businessTime , 'Publisher',  Publisher() ),
  _Route( FontAwesomeIcons.print , 'Published',  Published() ),
  _Route( FontAwesomeIcons.warning , 'Publish',  Publish() ),
  //_Route( FontAwesomeIcons.subscript , 'Subscribed', Subscribed() ),
];
final pageRoutesUtn = <_Route>[
  _Route( FontAwesomeIcons.school , 'Utn',  Utn() ),
  _Route( FontAwesomeIcons.check , 'Check JobOffers',  Evaluation() ),
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