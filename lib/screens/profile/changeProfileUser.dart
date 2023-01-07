import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/profile/input/inputBirthdate.dart';
import 'package:jobs_bank/screens/profile/input/inputGenre.dart';
import 'package:jobs_bank/screens/profile/input/inputText.dart';
import 'package:jobs_bank/screens/profile/input/inputTypeStudent.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';

class ChangeProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
    
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
              type: ButtonType.primary, 
              label: textButtonChangeName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Nombre",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeLastName,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Apellido",))));
              },
            ),     
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeIdentification,
              iconLeft: Icons.person,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Identificacion",))));
              },
            ),                      
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangePhone,
              iconLeft: Icons.phone,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Telefono",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeEmail,
              iconLeft: Icons.email,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Email",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangePassword,
              iconLeft: Icons.password,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "Password",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeGenre,
              iconLeft: Icons.home_work,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputGenre())));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin),
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeBirthdate,
              iconLeft: Icons.home_work,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputBirthdate())));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeTypeStudent,
              iconLeft: Icons.home_work,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputTypeStudent())));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
            BounceButton(
              buttonSize: ButtonSize.small, 
              type: ButtonType.primary, 
              label: textButtonChangeWebPage,
              iconLeft: Icons.home_work,
              textColor: buttonChangeProfile,
              horizontalPadding: true,
              contentBasedWidth: true,
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "WebPage",))));
              },
            ),                        
            const SizedBox(height: kDefaultPaddin), 
        ],
      ),
          )),
    );
  }

}
