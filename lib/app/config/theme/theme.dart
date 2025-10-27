import 'package:flutter/material.dart';

import 'ui/app_styles.dart';
import 'ui/colors_app.dart';
import 'ui/text_styles.dart';

class Theme {
  Theme._();

  static final colors = ColorsApp.instance;
  static final textStyles = TextStyles.instance;

  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.grey[200],
    colorScheme: ColorScheme.fromSeed(seedColor: colors.primary, surfaceTint: Colors.transparent),
    splashColor: Colors.transparent,
    fontFamily: 'SFProDisplay',
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.secondary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'SFProDisplay',
      ),
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontFamily: 'SFProDisplay', fontSize: 15, color: Colors.black87),
      bodyMedium: TextStyle(fontFamily: 'SFProDisplay', fontSize: 17, color: Colors.black87),
      titleLarge: TextStyle(
        fontFamily: 'SFProDisplay',
        fontWeight: FontWeight.bold,
        fontSize: 21,
        color: Colors.black87,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colors.secondary,
      circularTrackColor: colors.terciary.withValues(alpha: .3),
      strokeCap: StrokeCap.round,
      trackGap: 5,
    ),
    dialogTheme: DialogThemeData(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      titleTextStyle: TextStyles.instance.textTitle.copyWith(fontSize: 21),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: AppStyles.instance.secondaryButton),
    textButtonTheme: TextButtonThemeData(style: AppStyles.instance.textButton),
    outlinedButtonTheme: OutlinedButtonThemeData(style: AppStyles.instance.primaryOutlinedButton),
    inputDecorationTheme: _defaultInputDecorationTheme,
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: _defaultInputDecorationTheme,
      textStyle: textStyles.textRegular.copyWith(color: Colors.grey),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.secondary,
      foregroundColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(thickness: .8),
  );

  static final _defaultOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final _defaultInputDecorationTheme = InputDecorationTheme(
    activeIndicatorBorder: BorderSide(color: Colors.grey[400]!),
    fillColor: Colors.white,
    filled: true,
    isDense: true,
    border: _defaultOutlineInputBorder,
    enabledBorder: _defaultOutlineInputBorder,
    focusedBorder: _defaultOutlineInputBorder,
    errorBorder: _defaultOutlineInputBorder.copyWith(borderSide: BorderSide(color: Colors.red.shade700)),
    focusedErrorBorder: _defaultOutlineInputBorder.copyWith(borderSide: BorderSide(color: Colors.red.shade700)),
    labelStyle: textStyles.textRegular.copyWith(color: Colors.grey),
    errorStyle: textStyles.textRegular.copyWith(color: Colors.red.shade700),
  );
}
