import 'package:bikesafe_mobile/utilities/theme/color_scheme.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(
    {@required BuildContext context,
    bool showMenu = false,
    hideBack: false,
    title: ""}) {
  return AppBar(
    elevation: 0.0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NormalText(
          title,
          color: DeepBlueColorScheme.white,
          overflow: TextOverflow.clip,
        )
      ],
    ),
    leading: !showMenu && (hideBack || !Navigator.of(context).canPop())
        ? SizedBox()
        : null,
    backgroundColor: Theme.of(context).primaryColor,
    iconTheme: IconThemeData(color: Theme.of(context).backgroundColor),
    textTheme: Theme.of(context).textTheme,
    brightness: Brightness.dark,
    actions: [
            SizedBox(
              width: 60,
            )
          ],
  );
}
