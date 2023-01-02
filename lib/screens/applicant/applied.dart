import 'package:flutter/material.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';
import 'package:jobs_bank/widgets/userActive/jobApplicantDrawer.dart';

class Applied extends StatelessWidget{
  const Applied({Key? key,}) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context),
      drawer: DrawDrawer(),
      body: JobApplicantDrawer(),
    );
  }

  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text("Bolsa de Trabajo UTN"),
    );
  }  
 
}