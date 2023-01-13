import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/providers/publishFormProvider.dart';
import 'package:jobs_bank/screens/publisher/classes/jobOfferModify.dart';
import 'package:provider/provider.dart';

class BodyModify extends StatelessWidget{  
  final User user;
  final JobOffer jobOffer;
  const BodyModify({Key? key, required this.user, required this.jobOffer,}) : super(key: key);  

  @override
  Widget build(BuildContext context) {    
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(      
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                /* Image.asset(
                  "assets/images/texture.jpg",
                  width: 600,
                  height: 800,
                  fit: BoxFit.cover,
                ), */
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: defaultPaddingLeftAndRight,
                    right: defaultPaddingLeftAndRight,
                  ),
                  height: 1150,
                   decoration: const BoxDecoration(
                    //color: themeBodyPublishBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),                  
                  child: Column(
                    children:<Widget>[
                      const SizedBox(height: 10),
                      ChangeNotifierProvider(
                        create: (_) => PublishFormProvider(),
                        child: JobOfferModify(user: user, jobOffer: jobOffer,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    
  }  

}