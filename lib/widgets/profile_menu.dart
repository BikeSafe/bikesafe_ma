import 'package:bikesafe_mobile/utilities/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    this.myIcon,
    this.press,
  }) : super(key: key);

  final String text;
  final Icon myIcon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        disabledColor: Colors.grey[200],
        disabledTextColor: Colors.orange,
        onPressed: press,
        child: Row(
          children: [
            myIcon,
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
