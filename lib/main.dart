import 'package:bikesafe_mobile/controllers/account.dart';
import 'package:bikesafe_mobile/screens/count_modify_data.dart';
import 'package:bikesafe_mobile/screens/count_profile.dart';
import 'package:bikesafe_mobile/screens/count_sign_in.dart';
import 'package:bikesafe_mobile/screens/count_sign_up.dart';
import 'package:bikesafe_mobile/screens/count_user_data.dart';
import 'package:bikesafe_mobile/screens/route_create.dart';
import 'package:bikesafe_mobile/utilities/inherited_account_data_provider.dart';
import 'package:bikesafe_mobile/utilities/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final accountController = AccountController();
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
    return InheritedAccountDataProvider(
      child: MaterialApp(
        title: 'Bikesafe',
        theme: AwesomeTheme.awesomeTheme,
        home: CountSignIn(),
        routes: routes,
      ),
      controller: accountController,
    );
  }
}
