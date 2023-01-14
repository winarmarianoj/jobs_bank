import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/widgets/userActive/bodyUtnEvaluationDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Evaluation extends StatelessWidget{
  const Evaluation({Key? key,}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context),
      drawer: DrawDrawer(),
      body: BodyUtnEvaluationDrawer(),
    );
  }

  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitleAppBarByUtn),
    );
  }  
 
}