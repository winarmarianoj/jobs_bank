import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/screens/components/joboffer/detailsScreenJobOffer.dart';
import 'package:jobs_bank/screens/components/joboffer/itemCardJobOffer.dart';
import 'package:jobs_bank/service/jobOfferService.dart';

class BodyHome extends StatelessWidget{  
  BodyHome({Key? key,}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    final JobOfferService jobOfferService = JobOfferService();    
    return Stack(
      children: [
        Image.asset(
          "assets/images/texture.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: FutureBuilder(                  
                  future: jobOfferService.getJobOfferAll(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      List<JobOffer>? jobofferlist = snapshot.data as List<JobOffer>;
                      return GridView.builder(
                          itemCount: amountListJobOffer(snapshot.data),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: defaultPAddinBodyHome,
                            crossAxisSpacing: defaultPAddinBodyHome,
                            childAspectRatio: childAspectRatioBodyHome,
                          ),
                          itemBuilder: (context, index) => ItemCardJobOffer(
                            jobOffer: jobofferlist[index],
                            press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreenJobOffer(
                                  jobOffer: jobofferlist[index],
                                ),
                              ),
                            ),
                          ),
                        );
                    }else if(snapshot.hasError){
                      print(snapshot.error);
                      return Text("Error al traer joboffer.");
                    }

                    return Center(child: CircularProgressIndicator(),);
                  },
                ),
              ),
            ),
          ],
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