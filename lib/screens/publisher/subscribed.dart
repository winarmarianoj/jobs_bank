import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/widgets/userActive/bodySubscribedDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Subscribed extends StatelessWidget{
  final JobOffer jobOffer;
  const Subscribed({Key? key, required this.jobOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer: DrawDrawer(),
      body: BodySubscribedDrawer(jobOffer: jobOffer,),
    );
  }
  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitleSubscribed),
    );
  }  

}