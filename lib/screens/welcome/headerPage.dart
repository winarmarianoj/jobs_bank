import 'package:flutter/material.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/welcome/pages/objectAnimationWelcome.dart';

class HeadersPage extends StatelessWidget {
  final User user;
  const HeadersPage({Key? key, required this.user,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ObectAnimationWelcome(user: user,),      
    );    
  }
}
