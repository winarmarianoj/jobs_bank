import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/widgets/joboffer/joboffers/jobOfferDataWidget.dart';
import 'package:jobs_bank/service/jobOfferService.dart';
import 'package:jobs_bank/widgets/text/myText.dart';

class DescriptionJobOfferByUtn extends StatefulWidget {
  final JobOffer jobOffer;
  final User user;
  const DescriptionJobOfferByUtn({Key? key, required this.jobOffer, required this.user,}) : super(key: key); 

  @override
  State<DescriptionJobOfferByUtn> createState() => _DescriptionJobOfferByUtnState(jobOffer, user);
}

class _DescriptionJobOfferByUtnState extends State<DescriptionJobOfferByUtn> {
  final JobOffer jobOffer;
  final User user;
  _DescriptionJobOfferByUtnState(this.jobOffer, this.user);

  JobOfferService jobOfferService = JobOfferService();
  String selectedState = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobOfferDataWidget(jobOffer: jobOffer),
          if (!user.isUtnHome) Container(
            child: DropdownButtonFormField(
              items: <String>['APPROVED', 'REJECTED', 'REVIEW', 'DELETED'].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              hint: MyText(text: textSelectedEvalutaionJobOffer),
              onSaved: (value) {
                setState(() {
                  selectedState = value!;
                });
              }, 
              onChanged: (value) {
                setState(() {
                  selectedState = value!;
                  jobOfferService.jobOfferEvaluation(selectedState, jobOffer, context);
                });
              },
            ),                
          ),             
        ],
      ),
    );
  }
}
