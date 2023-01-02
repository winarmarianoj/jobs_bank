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
        decoration: BoxDecoration(
            //color: kFondo,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),              
            ),
            border: Border.all(
              color: kFondo,
              width: 4.0,
            ),
          ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ItemCardTextWidget(label: "", text: jobOffer.title, fontWeight: FontWeight.bold, size: 16, /*color: itemCardColorTextJobOffer*/),
              ItemCardTextWidget(label: "", text: jobOffer.description, fontWeight: FontWeight.w700, size: 11, /*color: itemCardColorTextJobOffer*/),
              ItemCardTextWidget(label: "", text: jobOffer.category + "-" + jobOffer.modality + "-" + jobOffer.position, fontWeight: FontWeight.w900, size: 10, /*color: itemCardColorTextJobOffer*/),
              ItemCardTextWidget(label: "Area ", text: jobOffer.area + " / " + "Experiencia " + jobOffer.experience, fontWeight: FontWeight.w600, size: 11, /*color: itemCardColorTextJobOffer*/),
            ],
          ),
      ),
    );
  }
}

