import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_bank/routes/routes.dart';
import 'package:jobs_bank/theme/themeChange.dart';
import 'package:provider/provider.dart';

class OptionRoutesApplicant extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: ( context, i) => Divider(
          color: appTheme.primaryColorLight,
        ), 
        itemCount: pageRoutesApplicant.length,
        itemBuilder: (context, i) => ListTile(
          leading: FaIcon( pageRoutesApplicant[i].icon , color: appTheme.hintColor ),
          title: Text( pageRoutesApplicant[i].titulo ),
          trailing: Icon( Icons.chevron_right, color: appTheme.hintColor ),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context)=> pageRoutesApplicant[i].page ));
          },
        ), 
      ), 
    );
  }
}