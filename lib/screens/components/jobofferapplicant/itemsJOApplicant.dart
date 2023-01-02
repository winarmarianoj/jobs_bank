import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/jobofferapplicant/detailsScreenJOApplicant.dart';
import 'package:jobs_bank/widgets/itemCardWidgetText/itemCardTextWidget.dart';
import 'package:jobs_bank/widgets/text/myText.dart';

class ItemsJOApplicant extends StatelessWidget {
  final JobOfferApplicant joApp;
  final User? user;
  final VoidCallback? press;
  const ItemsJOApplicant({Key? key, required this.joApp,
   this.user, this.press, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: detailJobOfferApplied,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        border: Border.all(
          color: kFondo,
          width: 4.0,
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreenJOApplicant(
                  user: user,
                  joApp: joApp,
                ),
              )
          );
        }, 
        title: ItemCardTextWidget(label: "", text: joApp.title + " " + joApp.description + " " + joApp.area, fontWeight: FontWeight.bold, size: 12),
        subtitle: ItemCardTextWidget(label: "", text: joApp.experience + " " + joApp.modality + " " + joApp.position + " " + joApp.category, fontWeight: FontWeight.bold, size: 11),
        leading: CircleAvatar(
          child: MyText(text: joApp.title.substring(0,1), ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

