import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/profile/profileUser.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';
import 'package:provider/provider.dart';

class InputTypeStudent extends StatefulWidget { 
  const InputTypeStudent({Key? key, }) : super(key: key);

  @override
  State<InputTypeStudent> createState() => _InputTypeStudentState();
}

class _InputTypeStudentState extends State<InputTypeStudent> {
  String selectedTypeStudent = '';
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
                  textWriterNewChangeByVariable + " Tipo de Estudiante: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Form(                      
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 300,
                    child: Column(                    
                      children: [                      
                        DropdownButtonFormField(
                          items: <String>['ACTIVE', 'REGULAR', 'RECEIVED'].map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          hint: MyText(text: textSelectedRoleInRegister),
                          onSaved: (value) {
                            setState(() {
                              selectedTypeStudent = value!;
                            });
                          }, 
                          onChanged: (value) {
                            setState(() {
                              selectedTypeStudent = value!;
                              context.read<UserCubit>().changeTypeStudent(value);
                            });
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
