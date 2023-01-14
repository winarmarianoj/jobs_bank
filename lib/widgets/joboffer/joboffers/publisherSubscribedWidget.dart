import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/home/home.dart';
import 'package:jobs_bank/screens/publisher/classes/jobOfferModify.dart';
import 'package:jobs_bank/screens/publisher/modify.dart';
import 'package:jobs_bank/screens/publisher/publisher.dart';
import 'package:jobs_bank/screens/publisher/subscribed.dart';
import 'package:jobs_bank/service/jobOfferService.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/text/myText.dart';

class PublisherSubscribedWidget extends StatelessWidget {
  const PublisherSubscribedWidget({
    Key? key,
    required this.jobOffer, required this.user,
  }) : super(key: key);

  final JobOffer jobOffer;
  final User user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; 
    JobOfferService jobOfferService = JobOfferService();
    return Container(
      child: Column(
        children: [
          const SizedBox(height: kDefaultPaddin),
          BounceButton(
            buttonSize: ButtonSize.medium,
              type: ButtonType.subscriptos,
              label: 'Ver Subscriptos',
              iconLeft: Icons.list,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Subscribed(                        
                      jobOffer: jobOffer,
                    ),
                  ),
                );
              },
          ),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          BounceButton(
            buttonSize: ButtonSize.medium,
              type: ButtonType.subscriptos,
              label: 'Modificar Aviso',
              iconLeft: Icons.edit,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modify(   
                      user: user,                     
                      jobOffer: jobOffer,
                    ),
                  ),
                );
              },
          ),
          const SizedBox(height: defaultSpaceBetweenObjectsDescription),
          BounceButton(
            buttonSize: ButtonSize.medium,
              type: ButtonType.subscriptos,
              label: 'Eliminar Aviso',
              iconLeft: Icons.delete,
              onPressed: () {
                showDialog(context: context, 
                builder: (context) => AlertDialog(
                    title: MyText(text: "Eliminar Aviso"),
                    content: MyText(text: "Esta seguro que desea eliminar el Aviso?"),
                    actions: [
                      TextButton(onPressed:() {jobOfferService.deleteJobOffer(jobOffer, context);}, child: MyText(text: "SI",)),
                      TextButton(onPressed:() 
                      {Navigator.push(context,MaterialPageRoute(builder: (context) => Publisher(),),);},
                      child: MyText(text: "NO",)),
                    ],
                  ),
                );                
              },
          ),
          const SizedBox(height: kDefaultPaddin*2),
        ],
      ),
    );
  }
}