import 'package:bikesafe_mobile/screens/count_sign_in.dart';
import 'package:bikesafe_mobile/utilities/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    CountSignIn.routeName: (context) => CountSignIn()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bikesafe',
      theme: AwesomeTheme.awesomeTheme,
      home: CountSignIn(),
      routes: routes,
    );
  }
}
