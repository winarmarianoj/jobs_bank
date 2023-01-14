import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/detailsScreenJobOffer.dart';
import 'package:jobs_bank/screens/components/joboffer/itemCardJobOffer.dart';
import 'package:jobs_bank/service/reportServicies.dart';

class BodyPublished extends StatelessWidget{
  final User user;
  BodyPublished({Key? key, required this.user}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    final ReportService reportService = new ReportService();
    user.setIsPublisherHome = false;
    return Stack(
      children: [
        /* Image.asset(
          "assets/images/texture.jpg",
          width: 600,
          height: 800,
          fit: BoxFit.cover,
        ), */
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: FutureBuilder(                  
                  future: reportService.getJobOfferPublished(user, context),
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
                      return Text(logJobOfferFailedBodyPublished);
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