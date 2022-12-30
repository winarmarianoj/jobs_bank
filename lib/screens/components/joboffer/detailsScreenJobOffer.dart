import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/screens/components/joboffer/detailsBodyJobOffer.dart';
import 'package:jobs_bank/widgets/userActive/homeDrawer.dart';

class DetailsScreenJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  const DetailsScreenJobOffer({Key? key, required this.jobOffer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: HomeDrawer(),
      body: DetailsBodyJobOffer(jobOffer: jobOffer,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}