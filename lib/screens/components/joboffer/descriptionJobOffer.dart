import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/widget/applicantPostulateWidget.dart';
import 'package:jobs_bank/screens/components/joboffer/widget/jobOfferDataWidget.dart';
import 'package:jobs_bank/screens/components/joboffer/widget/publisherSubscribedWidget.dart';
import 'package:jobs_bank/screens/publisher/subscribed.dart';
import 'package:jobs_bank/service/applicantService.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';

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

          /*if (user.role == 'APPLICANT') Container(
            child: BounceButton(
              iconLeft: Icons.subscript,
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonAppliedByJobOffer,
              onPressed: () {
                ApplicantService service = ApplicantService();
                service.postulate(jobOffer.id, user, context);                
              },
            ),
          ) else if(user.role == 'PUBLISHER') Container(
            child: BounceButton(
                buttonSize: ButtonSize.superSmall,
                  type: ButtonType.subscriptos,
                  label: 'Ver Subscriptos',
                  iconRight: Icons.subscriptions,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Subscribed(                        
                          jobOffer: jobOffer,
                        ),
                      ),
                    );
                  },
              ),
          )       */   
          


        ]
        
      )
    );
  }
}
