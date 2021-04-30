import 'package:bikesafe_mobile/utilities/theme/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:bikesafe_mobile/utilities/theme/theme.dart';
import 'package:flutter/services.dart';

class EnhancedText extends StatelessWidget {
  final String hint;
  final String label;
  final String initialValue;
  final bool enabled;
  final bool isPassword;
  final bool isNumber;
  final bool isEmail;
  final bool autovalidate;
  final int maxLines;
  final int maxLength;
  final double fontSize;
  final double errorFontSize;
  final double errorHeight;
  final double height;
  final IconData iconId;
  final Function validator;
  final Function onSaved;
  final Function onIconClicked;
  final Function onTap;
  final TextInputFormatter formatter;
  final TextEditingController controller;

  EnhancedText(this.label, this.hint,
      {this.controller,
      this.initialValue,
      this.iconId,
      this.onSaved,
      this.validator,
      this.formatter,
      this.maxLength,
      this.maxLines = 1,
      this.fontSize = 18,
      this.errorFontSize,
      this.errorHeight,
      this.height = 80,
      this.enabled = true,
      this.isPassword = false,
      this.isNumber = false,
      this.isEmail = false,
      this.autovalidate = false,
      this.onIconClicked,
      this.onTap});

  static String isValidEmail(String emailCandidate) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailCandidate);
    if (!emailValid) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String isValidUsername(String usernameCandidate) {
    if (usernameCandidate.length < 3) {
      return 'Enter a valid user name';
    }
    return null;
  }

  static String isValidPassword(String passwordCandidate) {
    if (passwordCandidate.length < 3) {
      return 'Enter a valid password';
    }
    return null;
  }

  static String isValidOrderNumber(String orderNumberCandidate) {
    if (orderNumberCandidate.length < 4) {
      return 'Enter a valid order number';
    }
    return null;
  }

  static String isValidName(String nameCandidate) {
    if (nameCandidate.length < 3) {
      return 'Enter a valid name';
    }
    return null;
  }

  static String isValidPhone(String phoneCandidate) {
    bool phoneValid = RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(phoneCandidate
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", ""));
    if (!phoneValid) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var decoration =
        AwesomeTheme.getTextAreaDecoration(hint, errorFontSize, errorHeight);

    if (iconId != null) {
      decoration =
          AwesomeTheme.getTextAreaDecorationWithIcon(hint, iconId, onIconClicked);
    }

    return Container(
        height: label != null ? 150 : height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            label != null
                ? Container(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 7),
                  )
                : Container(),
            Container(
              child: TextFormField(
                autovalidate: autovalidate,
                autofocus: false,
                keyboardType: isNumber
                    ? TextInputType.number
                    : (isEmail
                        ? TextInputType.emailAddress
                        : TextInputType.text),
                inputFormatters: buildFormatters(),
                onTap: onTap,
                enabled: enabled,
                decoration: decoration,
                maxLines: maxLines,
                onSaved: onSaved,
                obscureText: isPassword,
                style: TextStyle(
                  color: DeepBlueColorScheme.gray,
                  fontSize: fontSize,
                ),
                validator: validator,
                controller: controller,
              ),
            ),
          ],
        ));
  }

  List<TextInputFormatter> buildFormatters() {
    List<TextInputFormatter> formatters = [];

    if (isNumber) {
      formatters.add(WhitelistingTextInputFormatter.digitsOnly);
    }
    if (maxLength != null) {
      formatters.add(LengthLimitingTextInputFormatter(maxLength));
    }
    if (formatter != null) {
      formatters.add(formatter);
    }

    if (formatters.isEmpty) {
      return null;
    }
    return formatters;
  }
}
