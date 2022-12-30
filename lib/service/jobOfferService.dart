import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';

class JobOfferService {

  Future<List<JobOffer>?> getJobOfferAll() async{
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/');
    List<JobOffer> joboffers = [];    
    final response = await http.get(url).timeout(Duration(seconds: 100));
    if(response.statusCode == 200){ 
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var item in jsonData){
        joboffers.add(
          JobOffer(id: item["id"], title: item["title"], description: item["description"], area: item["area"], 
          experience: item["experience"], modality: item["modality"], 
          position: item["position"], category: item["category"], body: item["body"], datePublished: '', 
          deleted: null, deletedDay: '', message: '', modifiedDay: '', state: ''));
      }
      return joboffers;
    }/* else if(response.statusCode != 200){
      CustomPopup(
        title: 'Resultado al traer los avisos',
        message: 'No hay avisos publicados.',
        buttonAccept: BounceButton(
          buttonSize: ButtonSize.small,
          type: ButtonType.secondary,
          label: 'OK',
          onPressed: () {},
        ),
      );
    } */
    else{
      throw Exception("Fallo traer la lista de Joboffers");
    }    
  }

  /* void createJobOffer(BuildContext context, PublishFormProvider publishForm) async{
    final userCubit = context.read<UserCubit>();
    User user = userCubit.getUserActive();
    var url = Uri.parse('http://10.0.2.2:8082/joboffer/' + userCubit);
    final response = await http.post(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': publishForm.title,
      'description': publishForm.description,
      'area': publishForm.area,
      'body': publishForm.body,
      'experience': publishForm.experience,
      'modality': publishForm.modality,
      'position': publishForm.position,
      'category': publishForm.category,
    }),
    ).timeout(Duration(seconds: 10));

    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body); 
      Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePublisher(loginForm: loginForm,)))); 
    }else{
      print("Fallo traer la lista de Joboffers");
    }
  } */

}


