import 'package:flutter/material.dart';
import 'package:bikesafe_mobile/assets/fonts.dart';
import './color_scheme.dart';

class AwesomeTheme {
  const AwesomeTheme();
  static ThemeData awesomeTheme = ThemeData(
    // Text themes
    fontFamily: FontFamilies.NUNITO_SANS,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: DeepBlueColorScheme.gray,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: FontFamilies.NUNITO,
      ),
      headline4: TextStyle(
        color: DeepBlueColorScheme.gray,
        fontSize: 18,
      ),
    ),
    scaffoldBackgroundColor: DeepBlueColorScheme.background,
    primarySwatch: DeepBlueColorScheme.primarySwatch,
    backgroundColor: DeepBlueColorScheme.white,
    primaryColor: DeepBlueColorScheme.dcxPrimary,
    accentColor: DeepBlueColorScheme.black,
    primaryColorDark: DeepBlueColorScheme.secondary,
    primaryColorLight: DeepBlueColorScheme.secondary,
    errorColor: DeepBlueColorScheme.red,
    cardTheme: CardTheme(color: DeepBlueColorScheme.secondary),
    iconTheme: IconThemeData(color: DeepBlueColorScheme.secondary),
    bottomAppBarColor: DeepBlueColorScheme.white,
    dividerColor: DeepBlueColorScheme.secondary,
    disabledColor: DeepBlueColorScheme.gray,
    colorScheme: ColorScheme(
        primary: DeepBlueColorScheme.dcxPrimary,
        primaryVariant: DeepBlueColorScheme.primaryLight,
        secondary: DeepBlueColorScheme.secondary,
        secondaryVariant: DeepBlueColorScheme.secondary,
        surface: DeepBlueColorScheme.dcxPrimary,
        background: DeepBlueColorScheme.background,
        error: Colors.red,
        onPrimary: DeepBlueColorScheme.dcxPrimary,
        onSecondary: DeepBlueColorScheme.secondary,
        onSurface: DeepBlueColorScheme.secondary,
        onBackground: DeepBlueColorScheme.white,
        onError: Colors.red,
        brightness: Brightness.light),
  );

  // TextStyles
  static InputDecoration getTextAreaDecoration(
    String hint,
    double fontSize,
    double fontHeight,
  ) {
    return InputDecoration(
      errorStyle: TextStyle(fontSize: fontSize, height: fontHeight),
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.secondary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.errorColor,
          width: 2,
        ),
      ),
      labelText: hint,
      hintText: hint,
    );
  }

  static InputDecoration getTextAreaDecorationWithIcon(
      String hint, IconData iconId, Function onIconClicked) {
    return InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: awesomeTheme.colorScheme.primaryVariant,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: awesomeTheme.colorScheme.primaryVariant,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: awesomeTheme.colorScheme.secondary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: awesomeTheme.errorColor,
            width: 2,
          ),
        ),
        labelText: hint,
        hintText: hint,
        suffixIcon: IconButton(
          icon: Icon(
            iconId,
            color: awesomeTheme.primaryColorDark,
          ),
          onPressed: onIconClicked,
        ));
  }

  static InputDecoration getMaterialIconTextFieldDecoration(
      String hint, IconData iconId) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.primaryColorDark,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.errorColor,
          width: 2,
        ),
      ),
      hintText: hint,
      labelText: hint,
      prefixIcon: Icon(
        iconId,
        color: awesomeTheme.primaryColorDark,
      ),
    );
  }

  static InputDecoration getTextFieldDecoration(String hint, IconData iconId) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.colorScheme.primaryVariant,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.primaryColorDark,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: awesomeTheme.errorColor,
          width: 2,
        ),
      ),
      hintText: hint,
      labelText: hint,
      prefixIcon: Icon(iconId),
    );
  }
}
