import 'package:bikesafe_mobile/utilities/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final Icon myIcon;

  InputText(this.label, {this.myIcon});
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
        icon: myIcon,
        labelText: label,
        labelStyle: TextStyle(
          color: DeepBlueColorScheme.gray,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: DeepBlueColorScheme.secondary),
        ),
      ),
    );
  }
}
