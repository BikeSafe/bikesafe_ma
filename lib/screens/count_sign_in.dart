import 'package:bikesafe_mobile/controllers/account.dart';
import 'package:bikesafe_mobile/screens/count_profile.dart';
import 'package:bikesafe_mobile/screens/count_sign_up.dart';
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
  bool hasCheckedSession = false;
  bool isCheckingSession = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool loading = false;
  AccountController accountController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    accountController = AccountController.of(context);
    if (!isCheckingSession) {
      isCheckingSession = true;
      checkSession();
    }
    if (!hasCheckedSession) {
      return Scaffold(
          body: SafeArea(child: Center(child: CircularProgressIndicator())));
    }
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Ingresar"),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Builder(builder: (BuildContext builderContext) {
      if (loading) {
        return Center(child: CircularProgressIndicator());
      }
      return Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText("Iniciar sesión"),
                NormalText("Ingresa tus datos."),
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
                GenericButton("Ingresar", onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  bool isAuthenticated =
                      await accountController.doLogin(email, password);
                  if (isAuthenticated) {
                    Navigator.of(context)
                        .pushReplacementNamed(CountProfile.routeName)
                        .then((value) => setState(() {
                              loading = false;
                            }));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext builderContext) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("Error"),
                          content: new Text("Incorrect username or password"),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                setState(() {
                                  loading = false;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),
                SizedBox(height: 20),
                GenericButton("Crear cuenta", onPressed: () {
                  Navigator.of(context).pushNamed(CountSignUp.routeName);
                }),
              ],
            )),
      ));
    });
  }

  checkSession() async {
    if (await accountController.doAutoLogin()) {
      await Navigator.of(context).pushReplacementNamed(CountProfile.routeName);
    }
    setState(() {
      hasCheckedSession = true;
    });
  }
}
