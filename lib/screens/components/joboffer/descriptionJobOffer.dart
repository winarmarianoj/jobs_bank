import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/widget/applicantPostulateWidget.dart';
import 'package:jobs_bank/screens/components/joboffer/widget/jobOfferDataWidget.dart';
import 'package:jobs_bank/screens/components/joboffer/widget/publisherSubscribedWidget.dart';

class DescriptionJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  final User user;
  const DescriptionJobOffer({Key? key, required this.jobOffer, required this.user,}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobOfferDataWidget(jobOffer: jobOffer),
          if (user.role == 'APPLICANT') ApplicantPostulateWidget(jobOffer: jobOffer, user: user),
          if (user.role == 'PUBLISHER') PublisherSubscribedWidget(jobOffer: jobOffer),
        ]
        
      )
    );
  }
}
