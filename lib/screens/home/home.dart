import 'package:flutter/material.dart';
import 'package:jobs_bank/screens/ui/home/myDrawer.dart';

class Home extends StatelessWidget{      
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(context), 
      drawer: HomeDrawer(),
      body: BodyHome(),
    );
  }
  AppBar EmptyAppBar(BuildContext context){
    return AppBar(
      //backgroundColor: themeAppBarHome,
      elevation: 10,
      title: Text("Bolsa de Trabajo UTN"),
    );
  }  

}