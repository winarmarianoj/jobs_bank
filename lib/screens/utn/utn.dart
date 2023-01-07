import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/screens/search/search.dart';
import 'package:jobs_bank/widgets/userActive/bodyHomeDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class Utn extends StatelessWidget{      
  const Utn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer: DrawDrawer(),
      body: BodyHomeDrawer(),
    );
  }
  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      elevation: 10,
      title: Text(textTitleAppBarByUtn),
      actions: <Widget>[
        const SizedBox(width: kDefaultPaddin / 2),        
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: textToolTipSearch,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );
          },
        ),
      ],
    );
  }  

}