import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/publisher/subscribed.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/itemCardWidgetText/itemCardTextWidget.dart';

class SEVA extends StatelessWidget {
  final JobOffer jobOffer;
  final User user;
  const SEVA({Key? key, required this.jobOffer, required this.user,}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemCardTextWidget(label: "", text: jobOffer.title, fontWeight: FontWeight.bold, /* color: kTitle, */ size: 22.0,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "", text: jobOffer.description, fontWeight: FontWeight.bold, /* color: descriptionJobOfferDetails */ size: 16,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Detalles: ", text: jobOffer.body, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Area: ", text: jobOffer.area, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Experiencia: ", text: jobOffer.experience, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Modalidad: ", text: jobOffer.modality, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Posición: ", text: jobOffer.position, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Categoría: ", text: jobOffer.category, fontWeight: FontWeight.normal, /* color: themeProductJobOfferPublisherTextTitle, */ size: 14,),
          const SizedBox(height: defaultSpaceBetweenTextAndButtonDescription),
          
          
        ],
      ),
    );
  }
}


