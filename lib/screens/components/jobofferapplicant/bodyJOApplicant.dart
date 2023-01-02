import 'package:flutter/material.dart';
import 'package:jobs_bank/models/JobOfferApplicant.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/jobofferapplicant/itemsJOApplicant.dart';
import 'package:jobs_bank/service/reportServicies.dart';

class BodyJOApplicant extends StatelessWidget{
  final User? user;
  BodyJOApplicant({Key? key, this.user}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    final ReportService reportService = new ReportService();
    return Stack(
      children: [
        /* Image.asset(
          "assets/images/texture.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        ), */
        FutureBuilder(                  
          future: reportService.getJobOfferApplied(user!),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List<JobOfferApplicant>? jobOfferAppList = [];
              jobOfferAppList = snapshot.data as List<JobOfferApplicant>?;
              return ListView.builder(
                  itemCount: amountListJobOffer(snapshot.data),                  
                  itemBuilder: (context, index) => ItemsJOApplicant(
                    user: user,
                    joApp: jobOfferAppList![index],
                  ),
                );
            }else if(!snapshot.hasData){
              print("No trae los avisos del home.");
            }else if(snapshot.hasError){
              print(snapshot.error);
              return Text("Error al traer jobofferApplied.");
            }

            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ],
    );    
  }

  int amountListJobOffer(info){
    int count = 0;
    for (var data in info){
      count++;
    }
    return count;
  }

}