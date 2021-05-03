import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/enhanced_text.dart';
import 'package:bikesafe_mobile/widgets/generic_button.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:bikesafe_mobile/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CountSignIn extends StatefulWidget {
  static String routeName = "CountSignIn";
  @override
  _CountSignInState createState() => _CountSignInState();
}

class _CountSignInState extends State<CountSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Sign In"),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText("Iniciar sesión"),
            NormalText("Ingresa tus datos."),
            EnhancedText(
              null,
              "Email",
              isEmail: true,
              validator: EnhancedText.isValidEmail,
              autovalidate: false,
            ),
            EnhancedText(
              null,
              "Password",
              isPassword: true,
            ),
            GenericButton("Login", onPressed: () {
              Navigator.of(context);
            })
          ],
        ),
      )),
    );
  }
}