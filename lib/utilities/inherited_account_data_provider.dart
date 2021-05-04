import 'package:bikesafe_mobile/controllers/account.dart';
import 'package:flutter/material.dart';

class InheritedAccountDataProvider extends InheritedWidget {
  final AccountController controller;

  InheritedAccountDataProvider({Widget child, @required this.controller})
      : assert(controller != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedAccountDataProvider oldWidget) =>
      controller != oldWidget.controller;
}
