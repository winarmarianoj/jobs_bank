import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/detailsBodyJobOffer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class DetailsScreenJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  final User user;
  const DetailsScreenJobOffer({Key? key, required this.jobOffer, required this.user,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: DrawDrawer(),
      body: DetailsBodyJobOffer(jobOffer: jobOffer, user: user,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(textTitleJOApplicant),
      leading: IconButton(
        color: colorIconAppBar,
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}