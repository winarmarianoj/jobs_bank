import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/welcome/headerPage.dart';
import 'package:jobs_bank/theme/menuTheme.dart';
import 'package:jobs_bank/theme/themeChange.dart';
import 'package:provider/provider.dart';

import 'providers/loginFormProvider.dart';
import 'providers/registerFormProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger(6)),
        BlocProvider(create: ( _ ) => UserCubit() ),
      ],
      child: Builder(
        builder: (context) {
          final appTheme = Provider.of<ThemeChanger>(context);
          return MaterialApp(            
            debugShowCheckedModeBanner: false,
            title: textTitleWebSite,
            initialRoute: textInitialRouteApp,
            home: HeadersPage(),
            theme: appTheme.darkTheme ? themeDarkTwo : themeLightTwo, 
            //theme: appTheme.darkTheme ? themeDarkOne : themeLightOne, 
            //theme: appTheme.darkTheme ? ThemeData.dark() : ThemeData.light(), 
          );
        }
      ),      
    );     
  } 
    
}

