import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/widgets/itemCardWidgetText/itemCardTextWidget.dart';

class DescriptionJOAppByPublisher extends StatelessWidget {
  final JobOfferApplicant joApp;
  final User? user;
  const DescriptionJOAppByPublisher({Key? key, required this.joApp, this.user,}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemCardTextWidget(label: "JobOfferApplicantID: ", text: joApp.jobOfferApplicantID.toString() + " " + "Aplicado: " + joApp.applied, fontWeight: FontWeight.bold, /* color: themeProductJobOfferAppliedTextTitle, */ size: 14.0,),          
          ItemCardTextWidget(label: "Día Eliminado: ", text: joApp.deletedDay + " " + "ApplicantID: " + joApp.applicantID.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          ItemCardTextWidget(label: "Nombre: ", text: joApp.name + " " + "Apellido: " + joApp.surname, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "DNI: ", text: joApp.dni + " " + "Teléfono: " + joApp.phoneNumber, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Email: ", text: joApp.email, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Tipo Estudiante: ", text: joApp.typeStudent + " " + "JobOfferID: " + joApp.jobOfferID.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Título: ", text: joApp.title + " " + "Area: " + joApp.area, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Descripción: ", text: joApp.description, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),                    
          ItemCardTextWidget(label: "Cuerpo: ", text: joApp.body, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Experiencia: ", text: joApp.experience + " " + "Modalidad: " + joApp.modality, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Posición: ", text: joApp.position + " " + "Categoría: " + joApp.category, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Descripción Categoría: ", text: joApp.categoryDescription, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Publicado: ", text: joApp.datePublished + " " + "Modificado: " + joApp.modifiedDay, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Eliminado: ", text: joApp.jobOfferDeletedDay + " " + "Eliminado?: " + joApp.jobOfferDeleted.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
          ItemCardTextWidget(label: "Estado: ", text: joApp.state, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),          
        ],
      ),
    );
  }
}
