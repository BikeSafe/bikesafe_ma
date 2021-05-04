import 'package:bikesafe_mobile/controllers/account.dart';
import 'package:bikesafe_mobile/screens/count_modify_data.dart';
import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:bikesafe_mobile/widgets/profile_pic.dart';
import 'package:bikesafe_mobile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';

class CountUser extends StatefulWidget {
  static String routeName = "CountUser";
  @override
  _CountUserState createState() => _CountUserState();
}

// ! To complete
class _CountUserState extends State<CountUser> {
  bool isSwitched = false;
  AccountController accountController;
  @override
  Widget build(BuildContext context) {
    accountController = AccountController.of(context);
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
            NormalText("Nombre: ${accountController.currentUser.firstName}"),
            NormalText("Apellido: ${accountController.currentUser.lastName}"),
            NormalText("Edad: ${accountController.currentUser.age}"),
            NormalText("Email: ${accountController.currentUser.email}"),
            ProfileMenu(
              text: "Editar Datos",
              myIcon: Icon(Icons.edit),
              press: (){
                Navigator.of(context).pushNamed(CountModifyData.routeName);
              },
            )
          ],
        ),
      )),
    );
  }
}
