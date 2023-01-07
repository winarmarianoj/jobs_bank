import 'package:flutter/material.dart';
import 'package:jobs_bank/widgets/userActive/bodySearchDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Search extends StatelessWidget{      
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      drawer: DrawDrawer(),
      body: BodySearchDrawer(),
    );
  }

}