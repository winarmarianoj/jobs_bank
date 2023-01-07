import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/components/joboffer/detailsScreenJobOffer.dart';
import 'package:jobs_bank/service/jobOfferService.dart';
import 'package:jobs_bank/widgets/text/myText.dart';

class SearchUtn extends StatelessWidget{
  final String text;
  final User user;
  const SearchUtn({Key? key, required this.text, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobOfferService jobOfferService = JobOfferService(); 
    return FutureBuilder(
      future: jobOfferService.getJobOfferAll(context),
      //initialData: jobOfferService.getJobOfferAll(context),      
      builder: ((context, snapshot) {
        if(snapshot.hasData){
          List<JobOffer>? joboffers = snapshot.data as List<JobOffer>;
          List<JobOffer> list = [];
          if(text.isNotEmpty){
            list = joboffers.where((element) => 
                    element.state.contains(text))
                    .toList();
          }
          return Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var joboffer = list[index];
                return TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreenJobOffer(user: user, jobOffer: joboffer,),
                    ),
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              child: Icon(Icons.work),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(text: joboffer.title + " " + joboffer.state),
                              Text(joboffer.area + "-" + joboffer.modality),
                              Text(joboffer.position + "-" + joboffer.category),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          );  
        }else if(snapshot.hasError){
          print(snapshot.error);
          return Text(logJobOfferFailedBodyHome);
        }

        return Center(child: CircularProgressIndicator(),);
              
      })
    );    
  }
}