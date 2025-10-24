import 'package:flutter/material.dart';

import 'colors_app.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  // Avoid self isntance
  AppStyles._();
  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    backgroundColor: Colors.grey,
    textStyle: TextStyles.instance.textTitleItemList.copyWith(color: Colors.white),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  ButtonStyle get secondaryButton {
    return primaryButton.copyWith(backgroundColor: WidgetStateProperty.all<Color>(ColorsApp.instance.secondary));
  }

  ButtonStyle get textButton => TextButton.styleFrom(
    textStyle: TextStyles.instance.textSecondaryButtonLabel.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
    foregroundColor: ColorsApp.instance.primary,
  );
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}
