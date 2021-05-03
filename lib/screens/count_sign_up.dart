import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/enhanced_text.dart';
import 'package:bikesafe_mobile/widgets/generic_button.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:bikesafe_mobile/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CountSignUp extends StatefulWidget {
  static String routeName = "CountSignUp";
  @override
  _CountSignUpState createState() => _CountSignUpState();
}

class _CountSignUpState extends State<CountSignUp> {
  var userName = Row(
    children: <Widget>[
      new Flexible(child: EnhancedText(null, "Nombre")),
      new Flexible(child: EnhancedText(null, "Apellido")),
    ],
  );

  var userData = Row(
    children: <Widget>[
      new Flexible(
          child: EnhancedText(
        null,
        "Cédula",
        isNumber: true,
        validator: EnhancedText.isValidOrderNumber,
      )),
      new Flexible(
          child: EnhancedText(
        null,
        "Teléfono",
        isNumber: true,
        validator: EnhancedText.isValidPhone,
      )),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Registro"),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText("Crear Cuenta"),
            NormalText("Ingresa tus datos."),
            userName,
            userData,
            EnhancedText(
              null,
              "Email",
              isEmail: true,
              validator: EnhancedText.isValidEmail,
            ),
            EnhancedText(
              null,
              "Password",
              isPassword: true,
            ),
            GenericButton("Crear Cuenta", onPressed: () {
              Navigator.of(context);
            }),
          ],
        ),
      )),
    );
  }
}
