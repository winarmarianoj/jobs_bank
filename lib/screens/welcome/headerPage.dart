import 'package:flutter/material.dart';
import 'package:jobs_bank/screens/welcome/pages/objectAnimationWelcome.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ObectAnimationWelcome(),      
    );    
  }
}
