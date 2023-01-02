import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/jobofferapplicant/descriptionJOAppByStudent.dart';
import 'package:jobs_bank/screens/components/jobofferapplicant/descriptionJOAppByPublisher.dart';

class DetailsBodyJOApplicant extends StatelessWidget {
  final JobOfferApplicant joApp;
  final User? user;
  const DetailsBodyJOApplicant({Key? key, required this.joApp, this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(      
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                /* Image.asset(
                  "assets/images/cielo.jpg",
                  width: 500,
                  height: 900,
                  fit: BoxFit.cover,
                ), */
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    left: defaultPaddingLeftAndRight,
                    right: defaultPaddingLeftAndRight,
                  ),
                  height: 800,
                   decoration: const BoxDecoration(
                    color: detailJobOfferApplied,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      user!.role == 'APPLICANT' ? DescriptionJOAppByStudent(joApp: joApp, user: user,)
                       : DescriptionJOAppByPublisher(joApp: joApp, user: user,),                      
                    ],
                  ),                  
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}