import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/widgets/userActive/bodyPublishedDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Published extends StatelessWidget{      
  const Published({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer: DrawDrawer(),
      body: BodyPublishedDrawer(),
    );
  }
  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitlePublished),
    );
  }  

}