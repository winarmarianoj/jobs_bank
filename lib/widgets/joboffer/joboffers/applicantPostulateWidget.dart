import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/service/applicantService.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';

class ApplicantPostulateWidget extends StatelessWidget {
  const ApplicantPostulateWidget({
    Key? key,
    required this.jobOffer,
    required this.user,
  }) : super(key: key);

  final JobOffer jobOffer;
  final User user;

  @override
  Widget build(BuildContext context) {
    ApplicantService service = ApplicantService();
    return BounceButton(
      iconLeft: Icons.subscriptions,
      buttonSize: ButtonSize.small,
      type: ButtonType.primary,
      label: textButtonAppliedByJobOffer,
      onPressed: () {          
        service.postulate(jobOffer.id, user, context);                
      },
    );
  }
}