import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/profile/profileUser.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/message/customPopup.dart';
import 'package:jobs_bank/widgets/ui/inputDecorations.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';
import 'package:provider/provider.dart';

class InputBirthdate extends StatelessWidget { 
  const InputBirthdate({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
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
                  textWriterNewChangeByVariable + " Birthdate:",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Form(                      
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 300,
                    child: Column(                    
                      children: [                      
                        TextFormField(           
                          autocorrect: false,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecorations.authInputDecoration(
                              hintText: textHintBirthDateRegister,
                              labelText: textLabelBirthDateRegister,
                              prefixIcon: Icons.date_range),
                          onChanged: (value) => context.read<UserCubit>().changeBirthDate(value),
                          validator: (value) {                
                            return (value != null)
                                ? null
                                : 'El valor ingresado no es un texto valido';
                          },
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
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => ProfileUser())));
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
                builder: (context) => ProfileUser(),
              ),
            );
          },
        ),        
      ],
    );
  }
  
}

