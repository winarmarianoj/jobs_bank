import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/profile/classes/applicantButtons.dart';
import 'package:jobs_bank/screens/profile/classes/publisherButtons.dart';
import 'package:jobs_bank/screens/profile/input/inputText.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/userActive/bodyProfileDrawer.dart';

class ChangeProfileUser extends StatelessWidget {
  final User user;
  const ChangeProfileUser(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textTitleChangeProfile, ),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Nombre"))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeLastName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Apellido"))));
              },
            ),     
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(              
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeIdentification,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Identificacion"))));
              },
            ),                      
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangePhone,
              iconLeft: Icons.phone,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Telefono"))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangeEmail,
              iconLeft: Icons.email,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Email"))));
              },
            ),  
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonChangePassword,
              iconLeft: Icons.password,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Password"))));
              },
            ),            
            if(user.role == 'APPLICANT') ApplicantButtons(),
            if(user.role == 'PUBLISHER') PublisherButtons(),                            
            
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.subscriptos, 
              label: textButtonDeleteUser,
              iconLeft: Icons.delete,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {       
                showDialog(context: context, 
                builder: (context) => AlertDialog(
                    title: MyText(text: "Elimina Perfil Usuario"),
                    content: MyText(text: "Esta seguro que desea eliminarse de la Bolsa de Trabajo?"),
                    actions: [
                      TextButton(onPressed:() {context.read<UserCubit>().deleteUser(context);}, child: MyText(text: "SI",)),
                      TextButton(onPressed:() 
                      {Navigator.push(context, MaterialPageRoute(builder: ((context) => BodyProfileUserDrawer())));},
                      child: MyText(text: "NO",)),
                    ],
                  ),
                );
              }
            ),                        
          ],
        ),
      )
      ),
    );
  }

}
