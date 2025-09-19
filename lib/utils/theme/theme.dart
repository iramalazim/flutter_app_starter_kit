import 'package:e_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:e_store/utils/theme/custom_themes/text_theme.dart';

class EStoreTheme {
  EStoreTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Comfortaa',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: EStoreTextTheme.lightTextTheme,
    chipTheme: EStoreChipTheme.lightChipTheme,
    elevatedButtonTheme: EStoreElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: EStoreAppbarTheme.lightAppbarTheme,
    checkboxTheme: EStoreCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: EStoreBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: EStoreOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: EStoreTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Comfortaa',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: EStoreTextTheme.darkTextTheme,
    elevatedButtonTheme: EStoreElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: EStoreAppbarTheme.darkAppbarTheme,
    checkboxTheme: EStoreCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: EStoreBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: EStoreOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: EStoreTextFieldTheme.darkInputDecorationTheme,
  );
}
