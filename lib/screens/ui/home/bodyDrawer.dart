import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/home/home.dart';
import 'package:jobs_bank/service/authenticationService.dart';
import 'package:jobs_bank/service/profileService.dart';
import 'package:jobs_bank/widgets/routes/optionRoutesApplicant.dart';
import 'package:jobs_bank/screens/ui/login/loginScreen.dart';
import 'package:jobs_bank/theme/themeChange.dart';
import 'package:jobs_bank/widgets/routes/optionRoutesPublisher.dart';
import 'package:jobs_bank/widgets/routes/optionRoutesUtn.dart';
import 'package:jobs_bank/widgets/text/myText.dart';
import 'package:provider/provider.dart';
import '../../../models/User.dart';

class BodyDrawer extends StatelessWidget{
  final User user;
  final transitionDuration = Duration(milliseconds: 250);

  BodyDrawer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      width: 280,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
              child: SafeArea(            
                child: SizedBox(             
                  width: double.infinity,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: accentColor,
                    child: Text(textInitialsWebSiteName, style: TextStyle( fontSize: 30, color: Colors.black),),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            MyBodyMediumText(
              text: textWelcome + " " + user.name + " " + user.lastName,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: textWebSite + " " + textWebSiteName,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ), 
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: textTypeVehiclesWebSite,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ), 
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: textContactTitle + " " + textContactPhone,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),   
            const SizedBox(height: 5),
            MyBodyMediumText(
              text: textContactEmail,
              color: accentColor,
              fontWeight: FontWeight.bold,
            ), 
            const SizedBox(height: 5),

            if(user.role == "APPLICANT") OptionRoutesApplicant(),
            if(user.role == "PUBLISHER") OptionRoutesPublisher(),
            if(user.role == "UTN") OptionRoutesUtn(),            
            const SizedBox(height: 5),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: accentColor ),
              title: Text(textDarkModeTheme),
              trailing: 
              Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.darkTheme = value
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon( Icons.add_to_home_screen, color: accentColor ),
                title: Text(textCustomModeTheme),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme, 
                  activeColor: accentColor,
                  onChanged: ( value ) => appTheme.customTheme = value
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.login, color: accentColor ),
              title: Text(textLogin),
              onTap: () {                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              }
            ),
            ListTile(
              leading: Icon(Icons.logout, color: accentColor ),
              title: Text(textLogout),
              onTap: () {                
                AuthenticationService service = AuthenticationService();
                service.logoutUser(user, context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              }
            ),
          ],
      ),
    );
  }
  
  BoxDecoration colorsShopOfVehicles() => BoxDecoration(
          gradient: LinearGradient(colors: [
        themeDrawerBackground, 
        themeDrawerBackground, 
      ])
  );

}