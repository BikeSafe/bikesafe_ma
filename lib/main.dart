import 'package:bikesafe_mobile/screens/count_modify_data.dart';
import 'package:bikesafe_mobile/screens/count_profile.dart';
import 'package:bikesafe_mobile/screens/count_sign_in.dart';
import 'package:bikesafe_mobile/screens/count_sign_up.dart';
import 'package:bikesafe_mobile/screens/count_user_data.dart';
import 'package:bikesafe_mobile/screens/route_create.dart';
import 'package:bikesafe_mobile/utilities/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    CountSignIn.routeName: (context) => CountSignIn(),
    CountModifyData.routeName: (context) => CountModifyData(),
    CountProfile.routeName: (context) => CountProfile(),
    CountUser.routeName: (context) => CountUser(),
    CountSignUp.routeName: (context) => CountSignUp(),
    RouteCreate.routeName: (context) => RouteCreate()
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
