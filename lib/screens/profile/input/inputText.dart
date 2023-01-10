import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';
import 'package:jobs_bank/widgets/userActive/bodyProfileDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';
import 'package:provider/provider.dart';

class InputText extends StatelessWidget { 
  final String attribute;
  const InputText({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: DrawDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  textWriterNewChangeByVariable + attribute + " :",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Form(                      
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 300,
                    child: Column(                    
                      children: [                      
                        TextField(
                          keyboardType: TextInputType.text,
                          onChanged: (value) {changeNewAttribute(attribute, value, context);}
                        ), 
                        const SizedBox(height: 20),
                        BounceButton(
                          buttonSize: ButtonSize.small, 
                          type: ButtonType.primary, 
                          label: textSendDataButton,
                          iconLeft: Icons.send,
                          textColor: buttonInputText,
                          horizontalPadding: true,
                          contentBasedWidth: true,
                          onPressed:() {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => BodyProfileUserDrawer())));
                          },
                        ),               
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );  
  }

  AppBar buildAppBar(BuildContext context){
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Vuelve atrás',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyProfileUserDrawer(),
              ),
            );
          },
        ),        
      ],
    );
  }  
}

void changeNewAttribute(String attribute, String newAttribute, BuildContext context){
  switch(attribute){
      case 'Nombre':
      context.read<UserCubit>().changeName(newAttribute, context);
      break;
      case 'Apellido':
      context.read<UserCubit>().changeLastName(newAttribute, context);
      break;
      case 'Identificacion':
      context.read<UserCubit>().changeIdentification(newAttribute, context);
      break;
      case 'Telefono':
      context.read<UserCubit>().changePhone(newAttribute, context);
      break;
      case 'Email': 
      context.read<UserCubit>().changeEmail(newAttribute, context);
      break;
      case 'Password': 
      context.read<UserCubit>().changePassword(newAttribute, context);
      break;
      case 'WebPage': 
      context.read<UserCubit>().changeWebPage(newAttribute, context);
      break;      
      default:
      print(textTypeChangeNotExists);
      showDialog(context: context, 
        builder: (_) => CustomPopup(
            title: textTitleResultChangeNotExists,
            message: textTypeChangeNotExists,
            buttonAccept: BounceButton(
              buttonSize: ButtonSize.small,
              type: ButtonType.primary,
              label: textButtonShowDialogLogin,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ); 
      break;
  }

}
