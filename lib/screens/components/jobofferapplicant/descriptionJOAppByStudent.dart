import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/widgets/itemCardWidgetText/itemCardTextWidget.dart';

class DescriptionJOAppByStudent extends StatelessWidget {
  final JobOfferApplicant joApp;
  final User? user;
  const DescriptionJOAppByStudent({Key? key, required this.joApp, this.user,}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemCardTextWidget(label: "JobOfferApplicantID: ", text: joApp.jobOfferApplicantID.toString(), fontWeight: FontWeight.bold, /* color: themeProductJobOfferAppliedTextTitle, */ size: 16.0,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Applied: ", text: joApp.applied, fontWeight: FontWeight.bold, /* color: descriptionJobOfferDetails */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "DeletedDay: ", text: joApp.deletedDay, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "JobOfferID: ", text: joApp.jobOfferID.toString(), fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Title: ", text: joApp.title, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Description: ", text: joApp.description, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Area: ", text: joApp.area, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Cuerpo: ", text: joApp.body, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Experiencia: ", text: joApp.experience, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Modalidad: ", text: joApp.modality, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Posición: ", text: joApp.position, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Categoría: ", text: joApp.category, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Descripción Categoría: ", text: joApp.categoryDescription, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription), 
        ],
      ),
    );
  }
}
