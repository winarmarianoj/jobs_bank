import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/publisher/bodies/bodyModify.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Modify extends StatelessWidget{
  final User user;
  final JobOffer jobOffer;
  const Modify({Key? key, required this.user, required this.jobOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer: DrawDrawer(),
      body: BodyModify(user: user, jobOffer: jobOffer),
    );
  }
  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitleModifyPublisher),
    );
  }  

}