import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/widgets/itemCardWidgetText/itemCardTextWidget.dart';

class ItemCardJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  final VoidCallback press;
  const ItemCardJobOffer({Key? key, required this.jobOffer,
   required this.press, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.01),
            padding: EdgeInsets.only(
              top: size.height * 0.01,
              left: defaultPaddingLeftAndRight,
              right: defaultPaddingLeftAndRight,
            ),
        decoration: const BoxDecoration(
            color: kFondo,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: 
                  ItemCardTextWidget(label: "", text: jobOffer.title, fontWeight: FontWeight.bold, color: itemCardColorTextJobOffer),              
              ),
              ItemCardTextWidget(label: "", text: jobOffer.description, fontWeight: FontWeight.w900, color: itemCardColorTextJobOffer),
              ItemCardTextWidget(label: "", text: jobOffer.category, fontWeight: FontWeight.w900, color: itemCardColorTextJobOffer),
              ItemCardTextWidget(label: "", text: jobOffer.modality, fontWeight: FontWeight.w900, color: itemCardColorTextJobOffer),
              ItemCardTextWidget(label: "", text: jobOffer.position, fontWeight: FontWeight.w900, color: itemCardColorTextJobOffer),
              ItemCardTextWidget(label: "Area ", text: jobOffer.area, fontWeight: FontWeight.w900, color: itemCardColorTextJobOffer),
              ItemCardTextWidget(label: "Experiencia ", text: jobOffer.experience, fontWeight: FontWeight.w900, color: itemCardColorTextJobOffer),
            ],
          ),
      ),
    );
  }
}

