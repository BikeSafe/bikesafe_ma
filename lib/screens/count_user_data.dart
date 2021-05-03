import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:bikesafe_mobile/widgets/profile_pic.dart';
import 'package:bikesafe_mobile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';

class CountUser extends StatefulWidget {
  static String routeName = "LoginScreen";
  @override
  _CountUserState createState() => _CountUserState();
}

// ! To complete
class _CountUserState extends State<CountUser> {
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
            NormalText("Nombre: Pepito"),
            NormalText("Apellido: Alcachofa"),
            NormalText("Cédula: 12345678"),
            NormalText("Teléfono: 93746792924"),
            ProfileMenu(
              text: "Editar Datos",
              myIcon: Icon(Icons.edit),
            )
          ],
        ),
      )),
    );
  }
}
