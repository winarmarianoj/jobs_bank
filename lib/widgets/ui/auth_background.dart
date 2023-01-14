import 'package:flutter/material.dart';
import 'package:jobs_bank/constant/constantsColors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        child: const Icon(
          Icons.person_add,
          color: themePersonAddHeaderIcon,
          size: 100,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 95, left: 25),
          Positioned(child: _Bubble(), top: 160, left: 80),
          Positioned(child: _Bubble(), top: 40, left: 90),
          Positioned(child: _Bubble(), top: 70, right: 80),
          Positioned(child: _Bubble(), bottom: 50, left: 10),
          Positioned(child: _Bubble(), bottom: 135, right: 20),
          Positioned(child: _Bubble(), bottom: 90, right: 80),
          Positioned(child: _Bubble(), bottom: 45, right: 140),
          Positioned(child: _Bubble(), bottom: 30, right: 10),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeAuthBackgroundGradiantOne,
            themeAuthBackgroundGradiantTwo,
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
     
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: themeColorDecorationBubble),
    );
  }
}