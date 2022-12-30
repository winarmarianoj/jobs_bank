import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/widgets/itemCardWidgetText/itemCardTextWidget.dart';

class DescriptionJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  const DescriptionJobOffer({Key? key, required this.jobOffer}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ItemCardTextWidget(label: "", text: jobOffer.title, fontWeight: FontWeight.bold, color: kTitle),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "", text: jobOffer.description, fontWeight: FontWeight.bold, color: descriptionJobOfferDetails),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Detalles: ", text: jobOffer.body, fontWeight: FontWeight.normal, color: themeProductJobOfferPublisherTextTitle),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Area: ", text: jobOffer.area, fontWeight: FontWeight.normal, color: themeProductJobOfferPublisherTextTitle),
          ItemCardTextWidget(label: "Experiencia: ", text: jobOffer.experience, fontWeight: FontWeight.normal, color: themeProductJobOfferPublisherTextTitle),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Modalidad: ", text: jobOffer.modality, fontWeight: FontWeight.normal, color: themeProductJobOfferPublisherTextTitle),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Posición: ", text: jobOffer.position, fontWeight: FontWeight.normal, color: themeProductJobOfferPublisherTextTitle),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          ItemCardTextWidget(label: "Categoría: ", text: jobOffer.category, fontWeight: FontWeight.normal, color: themeProductJobOfferPublisherTextTitle),
        ],
      ),
    );
  }
}
