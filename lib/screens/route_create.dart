import 'package:bikesafe_mobile/utilities/theme/color_scheme.dart';
import 'package:bikesafe_mobile/widgets/app_bar.dart';
import 'package:bikesafe_mobile/widgets/generic_button.dart';
import 'package:bikesafe_mobile/widgets/input_text.dart';
import 'package:bikesafe_mobile/widgets/normal_text.dart';
import 'package:bikesafe_mobile/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../utilities/theme/color_scheme.dart';

class RouteCreateScreen extends StatefulWidget {
  static String routeName = "LoginScreen";
  @override
  _RouteCreateScreenState createState() => _RouteCreateScreenState();
}

class _RouteCreateScreenState extends State<RouteCreateScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Crear ruta"),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText("Crear Ruta"),
            NormalText("Ingresa los siguientes datos"),
            InputText(
              "Nombre de la ruta",
              myIcon: Icon(Icons.gesture),
            ),
            InputText(
              "Origen",
              myIcon: Icon(Icons.place),
            ),
            InputText(
              "Destino",
              myIcon: Icon(Icons.place),
            ),
            ListTile(
                title: Text('Ruta Pública'),
                leading: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: DeepBlueColorScheme.secondary,
                  inactiveTrackColor: DeepBlueColorScheme.gray,
                )),
            GenericButton("Crear Ruta", onPressed: () {
              Navigator.of(context);
            })
          ],
        ),
      )),
    );
  }
}
