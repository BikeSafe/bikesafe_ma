import 'package:bikesafe_mobile/screens/count_sign_in.dart';
import 'package:bikesafe_mobile/screens/count_user_data.dart';
import 'package:bikesafe_mobile/screens/route_create.dart';
import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/profile_pic.dart';
import 'package:bikesafe_mobile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';

class CountProfile extends StatefulWidget {
  static String routeName = "CountProfile";
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
              press: (){
                Navigator.of(context).pushNamed(CountUser.routeName);
              }
            ),
            ProfileMenu(
              text: "Transporte",
              myIcon: Icon(Icons.pedal_bike),
            ),
            ProfileMenu(
              text: "Rutas",
              myIcon: Icon(Icons.alt_route),
              press: (){
                Navigator.of(context).pushNamed(RouteCreate.routeName);
              }
            ),
            ProfileMenu(
              text: "Cerrar Sesión",
              myIcon: Icon(Icons.logout),
              press: (){
                Navigator.of(context).pushReplacementNamed(CountSignIn.routeName);
              },
            ),
          ],
        ),
      )),
    );
  }
}
