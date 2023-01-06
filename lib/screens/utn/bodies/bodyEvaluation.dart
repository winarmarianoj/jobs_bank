import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/detailsScreenJobOffer.dart';
import 'package:jobs_bank/screens/components/joboffer/itemCardJobOffer.dart';
import 'package:jobs_bank/service/jobOfferService.dart';

class BodyEvaluation extends StatelessWidget{
  final User user;
  BodyEvaluation({Key? key, required this.user}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    JobOfferService jobOfferService = JobOfferService();
    String selectedCategory = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(          
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: FutureBuilder(                                 
              future: jobOfferService.getJobOfferPending(context),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  List<JobOffer>? jobofferlist = snapshot.data as List<JobOffer>;
                  return GridView.builder(
                      itemCount: amountListJobOffer(snapshot.data),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        /* mainAxisSpacing: defaultPaddinBodyHome,
                        crossAxisSpacing: defaultPaddinBodyHome,
                        childAspectRatio: childAspectRatioBodyHome, */
                      ),
                      itemBuilder: (context, index) => ItemCardJobOffer(
                        jobOffer: jobofferlist[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreenJobOffer(
                              user: user,
                              jobOffer: jobofferlist[index],
                            ),
                          ),
                        ),
                      ),
                    );
                }else if(snapshot.hasError){
                  print(snapshot.error);
                  return Text(logJobOfferFailedBodyHome);
                }

                return Center(child: CircularProgressIndicator(),);
              },
            ),
          ),
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