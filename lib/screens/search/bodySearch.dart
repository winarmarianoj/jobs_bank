import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/search/components/searchJobOffer.dart';
import 'package:jobs_bank/screens/search/components/searchUtn.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';

class BodySearch extends StatefulWidget{
  final User user;
  const BodySearch({Key? key, required this.user}) : super(key: key);

  @override
  State<BodySearch> createState() => FirstSearch(user);
}

class FirstSearch extends State<BodySearch>{
  TextEditingController searchController = TextEditingController();
  final User user;
  FirstSearch(this.user);

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: DrawDrawer(),
      body: Center(
        child: SizedBox(
          width: 350,
          child: Column(
            children: [
              if(user.role == 'APPLICANT' || user.role == 'PUBLISHER')
              MyBodyLargeText(text: "Tipo Modalidad:\nONSITE, REMOTE, MIXED\n" + 
              "Tipo Posiciones:\nFULLTIME, PARTTIME, CONTRACT" + 
              "Tipo Categorías:\nFULLSTACK, BACKEND, FRONTEND, QA, BILLING, CONTRACT, DEVELOPER, UI-UX, THIRD-PARTIES",
              fontWeight: FontWeight.bold, size: 16.0,),
              
              if(user.role == 'UTN') MyBodyLargeText(text: "Estados posibles:\nACTIVE, APPROVED, DELETED, PENDING, PUBLISHED, REJECTED, REVIEW",
              fontWeight: FontWeight.bold, size: 16.0,),

              const SizedBox(height: kDefaultPaddin),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(hintText: textDecorationHintTextSearch),
              ),
              user.role == 'APPLICANT' || user.role == 'PUBLISHER' ? SearchJobOffer(text: searchController.text, user: user,)
              : SearchUtn(text: searchController.text, user: user,),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      title: Text(textTitleSearching, ),
      actions: <Widget>[        
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Vuelve atrás',
          onPressed: () {Navigator.pop(context);},
        ),        
      ],
    );
  }
}


