import 'package:bikesafe_mobile/models/register.dart';
import 'package:bikesafe_mobile/repositories/account.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Registro"),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: buildBody(),
      )),
    );
  }

  Widget buildBody() {
    if (loading) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("Crear Cuenta"),
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
                EnhancedText(
                  null,
                  "Password",
                  controller: _passwordController,
                  isPassword: true,
                ),
                GenericButton("Crear Cuenta", onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  try {
                    String firstName = _firstNameController.text;
                    String lastName = _lastNameController.text;
                    int age = int.parse(_ageController.text);
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    await AccountRepository.register(new Register(
                        firstName, lastName, age, email, password));
                    Navigator.of(context).pop();
                  } catch (error) {
                    print(error.toString());
                  }
                  setState(() {
                    loading = false;
                  });
                }),
              ],
            )));
  }
}
