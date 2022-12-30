import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsColors.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'dart:math';

import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/screens/welcome/classes/animateCar.dart';
import 'package:jobs_bank/screens/welcome/classes/animateCar64.dart';
import 'package:jobs_bank/screens/welcome/classes/animateFiat500.dart';
import 'package:jobs_bank/screens/welcome/classes/animateTruck.dart';
import 'package:jobs_bank/screens/welcome/classes/animateTruckRepar.dart';
import 'package:jobs_bank/screens/welcome/classes/animateTruckTrailer.dart';
import 'package:jobs_bank/screens/welcome/classes/animateVan.dart';
import 'package:jobs_bank/screens/welcome/classes/animateVanPickUp.dart';

class ObectAnimationWelcome extends StatefulWidget { 
  const ObectAnimationWelcome({Key? key, }) : super(key: key); 
  @override
  State<ObectAnimationWelcome> createState() => _VehiclesAnimadoPageState();
}

class _VehiclesAnimadoPageState extends State<ObectAnimationWelcome> with SingleTickerProviderStateMixin {
    
  _VehiclesAnimadoPageState();
  
  
  late AnimationController controller;
  // animaciones  
  late Animation<double> animationCar;
  late Animation<double> animationVan;
  late Animation<double> animationTruck;
  late Animation<double> animationTruckTrailer;
  late Animation<double> inAnimation;
  late Animation<double> enlargeAnimation;
  late Animation<double> shrinkAnimation;
  late Animation<double> rotateAnimation;
  late Animation<double> outAnimation;

  @override
  void initState() { 
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration( milliseconds: 5000 ));

    // Definimos animación de entrada desde fuera de la pantalla hasta su posición original
    inAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta la entrada en el primer 25% de la animación
      // Utilizamos el Curves.bounceOut para el ejecto de rebote al final
      curve: const Interval(0.00, 0.25, curve: Curves.bounceOut),
    ));

    // Definimos animación de agrandado hasta 5 veces
    enlargeAnimation = Tween(begin: 1.0, end: 5.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta la agrandado entre el 30% y 60% de la animación
      // Utilizamos el Curves.easeOutCubic para un efecto de agranddado acelerado al inicio y lento al final
      curve: const Interval(0.30, 0.60, curve: Curves.easeOutCubic),
    ));

    // Definimos animación de encojer con los valores a sustraer del agrandado para volver la escala original
    shrinkAnimation = Tween(begin: 0.0, end: 4.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta el encondido entre el 65% y 90% de la animación
      // Utilizamos el Curves.easeOutCubic para un efecto de encogido acelerado al inicio y lento al final
      curve: const Interval(0.65, 0.90, curve: Curves.easeOutCubic),
    ));

    // Definimo una rotación de 1 vuelta completa
    rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta el encondido entre el 65% y 90% de la animación, mismo intervalo que encojer
      // Utilizamos el Curves.easeInBack para el efecto de tomar impulso
      curve: const Interval(0.65, 0.90, curve: Curves.easeInBack),
    ));

    // Definimos la animación de salida ejecutarse desde su posición inicial hasta fuera de la pantalla
    outAnimation = Tween(begin: 0.0, end: -1.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta en el ultimo 10% de la animación
      curve: const Interval(0.90, 1.0, curve: Curves.easeInOutCirc),
    ));

    animationCar = Tween(begin: -128.0, end: 600.0).animate(controller);
    animationVan = Tween(begin: -50.0, end: 600.0).animate(controller);
    animationTruck = Tween(begin: 610.0, end: -400.0).animate(controller);
    animationTruckTrailer = Tween(begin: 700.0, end: -420.0).animate(controller);
    
    animationCar.addListener(() {
        setState(() {});        
    });
    animationVan.addListener(() {
        setState(() {});        
    });
    animationTruck.addListener(() {
        setState(() {});
         if(controller.status == AnimationStatus.completed){           
           Navigator.push(context, MaterialPageRoute(builder: ((context) => Home())));
         }
            
    });
    animationTruckTrailer.addListener(() {
        setState(() {});        
    });

    controller.addListener((){
      if ( controller.status == AnimationStatus.completed ) {
        controller.reverse();        
      }else if(controller.status == AnimationStatus.dismissed)
        controller.forward();        
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();    
  }

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UserCubit>();
    final height = MediaQuery.of(context).size.height * 0.5;
    final width = (MediaQuery.of(context).size.width * 0.5);
    controller.forward();
    return Container(
      child: Stack(
        children: <Widget>[
          new Positioned(
            child: AnimateCar(),
            left: animationCar.value,
            top: 30.0,
          ),
          new Positioned(
            child: AnimateVan(),
            left: animationVan.value,
            top: 320.0,
          ),
          new Positioned(
            child: AnimateTruck(),
            left: animationTruck.value,
            top: 100.0,
          ),
          new Positioned(
            child: AnimateTruckRepar(),
            right: animationTruck.value,
            top: 190.0,
          ),
          new Positioned(
            child: AnimateCar64(),
            left: animationTruck.value,
            top: 420.0,
          ),
          new Positioned(
            child: AnimateFiat500(),
            left: animationCar.value,
            top: 480.0,
          ),
          new Positioned(
            child: AnimateVanPickUp(),
            left: animationTruck.value,
            top: 600.0,
          ),          
          new Positioned(
            child: AnimateTruckTrailer(),
            left: animationTruckTrailer.value,
            top: 670.0,
          ),
          Center(
            child: Opacity(
              // Aprovechamos el valor de outAnimation para definir la opacidad y desaparecer al final
              opacity: 1 + outAnimation.value,

              child: Transform.rotate(
                // Se define la rotación
                angle: rotateAnimation.value,

                child: Transform.scale(
                  // El escalado es la diferencia a los valores de enlargeAnimation y shrinkAnimation
                  scale: enlargeAnimation.value - shrinkAnimation.value,

                  child: Transform.translate(
                    // La traslación dx utiliza el outAnimation para la salida mienstra dy utiliza inAnimation para la entrada
                    offset: Offset(outAnimation.value * width, inAnimation.value * height),
                    child: Container(width: 130.0, height: 50.0, color: themeWelcomeTextBackground, 
                      child: RichText(
                          text: TextSpan(
                            children: [                              
                              TextSpan(
                                text: textWelcomeTitleAnimation,
                                style: Theme.of(context).textTheme.headline6?.copyWith(
                                    color: themeWelcomeText, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),    
                    ),
                  ),
                ),
              ),
            ),
          ),                
        ],    
      ),      
    );    
  }    
}
