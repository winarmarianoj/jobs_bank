import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/descriptionJobOffer.dart';
import 'package:jobs_bank/screens/components/joboffer/descriptionJobOfferByUtn.dart';

class DetailsBodyJobOffer extends StatelessWidget {
  final JobOffer jobOffer;
  final User user;
  const DetailsBodyJobOffer({Key? key, required this.jobOffer, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        /* Image.asset(
          "assets/images/texture.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        ), */
        SingleChildScrollView(
          child: Column(
            children: <Widget>[          
              SizedBox(
                height: 550,// size.height,
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.04),
                  padding: EdgeInsets.only(
                    top: size.height * 0.04,
                    left: defaultPaddingLeftAndRight,
                    right: defaultPaddingLeftAndRight,
                  ),                  
                  decoration: BoxDecoration(
                    //color: kFondo,
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
                  child: Column(
                    children: <Widget>[
                      if(!user.conected) DescriptionJobOffer(jobOffer: jobOffer, user: user,),
                      if(user.role == 'APPLICANT' || user.role == 'PUBLISHER') DescriptionJobOffer(jobOffer: jobOffer, user: user,),
                      if(user.role == 'UTN') DescriptionJobOfferByUtn(jobOffer: jobOffer, user: user,),
                    ],
                  ),                  
                ),
              )
            ],
          ),
        ),
      ],
    );    
  }
}