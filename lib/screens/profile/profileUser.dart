import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_bank/constant/constantsText.dart';
import 'package:jobs_bank/cubit/userCubit.dart';
import 'package:jobs_bank/models/User.dart';
import 'package:jobs_bank/screens/profile/changeProfileUser.dart';

class ProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: BodyScaffold(),
      ),  
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.accessibility_new ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => ChangeProfileUser())))
      ),
   );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: ( _ , state) {
        switch ( state.runtimeType ) {          
          case UserInitial:
            return Center(child: Text(textNoDataUserInitial));
          case UserActive:
            return UserData( (state as UserActive).user );
          default:
            return Center( child: Text(textUnknownState));
        }
    });
  }
}

class UserData extends StatelessWidget {
  final User user;
  const UserData( this.user );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [              
              Text("Datos de su perfil", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
              Divider(),
              ListTile( title: Text('Nombre: ${ user.name }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Apellido: ${ user.lastName }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Identification: ${ user.identification }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Teléfono: ${ user.phone }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Email: ${ user.email }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
              ListTile( title: Text('Contraseña: ${ user.password }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),

              if (user.role == 'APPLICANT') Container(
                child: Column(
                  children: [
                    ListTile( title: Text('Género: ${ user.genre }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
                    ListTile( title: Text('Fecha Cumpleaños: ${ user.birthDate }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
                    ListTile( title: Text('Tipo Estudiante: ${ user.typeStudent }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),
                  ],
                ),
              ),
              if(user.role == 'PUBLISHER') Container(
                child: Column(
                  children: [
                    ListTile( title: Text('Sitio Web: ${ user.webPage }', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal,))),                    
                  ],
                ),
              ),              
            ],
          ),
    );
  }

}