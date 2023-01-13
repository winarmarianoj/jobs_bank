import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/screens/profile/input/inputBirthdate.dart';
import 'package:jobs_bank/screens/profile/input/inputGenre.dart';
import 'package:jobs_bank/screens/profile/input/inputTypeStudent.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';

class ApplicantButtons extends StatelessWidget {
  const ApplicantButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kDefaultPaddin),
        BounceButton(
          buttonSize: ButtonSize.small, 
          type: ButtonType.subscriptos, 
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
          type: ButtonType.subscriptos, 
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
          type: ButtonType.subscriptos, 
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
      ],
    );
  }
}
