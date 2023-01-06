import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';
import 'package:jobs_bank/widgets/userActive/bodyJOApplicantDrawer.dart';

class Applied extends StatelessWidget{
  const Applied({Key? key,}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context),
      drawer: DrawDrawer(),
      body: BodyJOApplicantDrawer(),
    );
  }

  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitleAppBarByApplicant),
    );
  }  
 
}