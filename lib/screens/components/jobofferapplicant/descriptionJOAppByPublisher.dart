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
          ItemCardTextWidget(label: "JobOfferApplicantID: ", text: joApp.jobOfferApplicantID.toString(), fontWeight: FontWeight.bold, /* color: themeProductJobOfferAppliedTextTitle, */ size: 14.0,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Aplicado: ", text: joApp.applied, fontWeight: FontWeight.bold, /* color: descriptionJobOfferDetails */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Día Eliminado: ", text: joApp.deletedDay, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "ApplicantID: ", text: joApp.applicantID.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Nombre: ", text: joApp.name, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Apellido: ", text: joApp.surname, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "DNI: ", text: joApp.dni, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Email: ", text: joApp.email, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Teléfono: ", text: joApp.phoneNumber, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Tipo Estudiante: ", text: joApp.typeStudent, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "JobOfferID: ", text: joApp.jobOfferID.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Título: ", text: joApp.title, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Descripción: ", text: joApp.description, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Area: ", text: joApp.area, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Cuerpo: ", text: joApp.body, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Experiencia: ", text: joApp.experience, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Modalidad: ", text: joApp.modality, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Posición: ", text: joApp.position, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Categoría: ", text: joApp.category, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Descripción Categoría: ", text: joApp.categoryDescription, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Publicado: ", text: joApp.datePublished, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Modificado: ", text: joApp.modifiedDay, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Eliminado: ", text: joApp.jobOfferDeletedDay, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Eliminado?: ", text: joApp.jobOfferDeleted.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Estado: ", text: joApp.state, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription), 
        ],
      ),
    );
  }
}
