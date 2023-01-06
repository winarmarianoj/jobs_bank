import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobs_bank/routes/routes.dart';
import 'package:jobs_bank/theme/themeChange.dart';
import 'package:provider/provider.dart';

class OptionRoutesPublisher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: ( context, i) => Divider(
          color: appTheme.primaryColorLight,
        ), 
        itemCount: pageRoutesPublisher.length,
        itemBuilder: (context, i) => ListTile(
          leading: FaIcon( pageRoutesPublisher[i].icon , color: appTheme.accentColor ),
          title: Text( pageRoutesPublisher[i].titulo ),
          trailing: Icon( Icons.chevron_right, color: appTheme.accentColor ),
          onTap: () {
            Navigator.push(context,
             MaterialPageRoute(builder: (context)=> pageRoutesPublisher[i].page ));
          },
        ), 
      ),
    );
  }
}