import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/jobofferapplicant/detailsBodyJOApplicant.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class DetailsScreenJOApplicant extends StatelessWidget {
  final JobOfferApplicant joApp;
  final User? user;
  const DetailsScreenJOApplicant({Key? key, required this.joApp, this.user,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: DrawDrawer(),
      body: DetailsBodyJOApplicant(joApp: joApp, user: user,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        //color: colorIconAppBar,
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}