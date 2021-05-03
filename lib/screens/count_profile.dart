import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/profile_pic.dart';
import 'package:bikesafe_mobile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';

class CountProfile extends StatefulWidget {
  static String routeName = "LoginScreen";
  @override
  _CountProfileState createState() => _CountProfileState();
}

class _CountProfileState extends State<CountProfile> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Perfil"),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfilePic(
              rad: 80,
            ),
            ProfileMenu(
              text: "Cuenta",
              myIcon: Icon(Icons.person),
            ),
            ProfileMenu(
              text: "Transporte",
              myIcon: Icon(Icons.pedal_bike),
            ),
            ProfileMenu(
              text: "Rutas",
              myIcon: Icon(Icons.alt_route),
            ),
            ProfileMenu(
              text: "Cerrar Sesión",
              myIcon: Icon(Icons.logout),
            ),
          ],
        ),
      )),
    );
  }
}
