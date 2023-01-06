import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/widgets/userActive/bodyPublishDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Publish extends StatelessWidget{
  const Publish({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer: DrawDrawer(),
      body: const BodyPublishDrawer(),
    );
  }
  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitleAppBarByPublisher),
    );
  }  

}