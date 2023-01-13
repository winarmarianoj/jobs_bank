import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/screens/profile/input/inputText.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';

class PublisherButtons extends StatelessWidget {
  const PublisherButtons({
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
          label: textButtonChangeWebPage,
          iconLeft: Icons.home_work,
          textColor: buttonChangeProfile,
          horizontalPadding: true,
          contentBasedWidth: true,
          onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => InputText(attribute: "WebPage"))));
          },
        ),                        
        const SizedBox(height: kDefaultPaddin),         
      ],
    );
  }
}
