import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:jobs_bank/widgets/userActive/bodyProfileDrawer.dart';
import 'package:jobs_bank/widgets/userActive/drawDrawer.dart';
import 'package:provider/provider.dart';

class InputGenre extends StatefulWidget { 
  const InputGenre({Key? key,}) : super(key: key);

  @override
  State<InputGenre> createState() => _InputGenreState();
}

class _InputGenreState extends State<InputGenre> {
  String selectedGenre = '';
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
                  textWriterNewChangeByVariable + " Género: ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Form(                      
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    width: 300,
                    child: Column(                    
                      children: [                      
                        DropdownButtonFormField(
                          items: <String>['FEMENINO', 'MASCULINO', 'OTRO'].map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          hint: MyText(text: textSelectedRoleInRegister),
                          onSaved: (value) {
                            setState(() {
                              selectedGenre = value!;
                            });
                          }, 
                          onChanged: (value) {
                            setState(() {
                              selectedGenre = value!;
                              context.read<UserCubit>().changeGenre(value, context);
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
