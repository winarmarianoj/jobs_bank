import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/widgets/joboffer/joboffers/applicantPostulateWidget.dart';
import 'package:jobs_bank/widgets/joboffer/joboffers/jobOfferDataWidget.dart';

class DescriptionJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  final User user;
  const DescriptionJobOffer({Key? key, required this.jobOffer, required this.user,}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobOfferDataWidget(jobOffer: jobOffer),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          if (user.role == 'APPLICANT') ApplicantPostulateWidget(jobOffer: jobOffer, user: user),
          const SizedBox(height: kDefaultPaddin*2),
        ]        
      )
    );
  }
}
