import 'package:bikesafe_mobile/controllers/account.dart';
import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/enhanced_text.dart';
import 'package:bikesafe_mobile/widgets/generic_button.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:bikesafe_mobile/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CountModifyData extends StatefulWidget {
  static String routeName = "CountModifyData";
  @override
  _CountModifyDataState createState() => _CountModifyDataState();
}

class _CountModifyDataState extends State<CountModifyData> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  bool wasInitialized = false;
  AccountController accountController;
  @override
  Widget build(BuildContext context) {
    accountController = AccountController.of(context);
    if (!wasInitialized) {
      _firstNameController.text = accountController.currentUser.firstName;
      _lastNameController.text = accountController.currentUser.lastName;
      _ageController.text = accountController.currentUser.age.toString();
      _emailController.text = accountController.currentUser.email;
      wasInitialized = true;
    }
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Actualizar Datos"),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText("Modificar Datos"),
                    NormalText("Ingresa tus datos."),
                    EnhancedText(
                      null,
                      "Nombre",
                      controller: _firstNameController,
                    ),
                    EnhancedText(
                      null,
                      "Apellido",
                      controller: _lastNameController,
                    ),
                    EnhancedText(
                      null,
                      "Edad",
                      controller: _ageController,
                    ),
                    EnhancedText(
                      null,
                      "Email",
                      controller: _emailController,
                      isEmail: true,
                      validator: EnhancedText.isValidEmail,
                    ),
                    GenericButton("Modificar Datos", onPressed: () {
                      accountController.currentUser.firstName =
                          _firstNameController.text;
                      accountController.currentUser.lastName =
                          _lastNameController.text;
                      accountController.currentUser.age =
                          int.parse(_ageController.text);
                      accountController.currentUser.email =
                          _emailController.text;
                      Navigator.of(context).pop();
                    }),
                  ],
                ))),
      )),
    );
  }
}
