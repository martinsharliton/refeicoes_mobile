import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  TextStyle get textLight => const TextStyle(fontWeight: FontWeight.w300, fontFamily: 'SFProDisplay');
  TextStyle get textRegular => const TextStyle(fontWeight: FontWeight.normal, fontFamily: 'SFProDisplay');

  TextStyle get textMedium => const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'SFProDisplay', fontSize: 20, color: Colors.black);

  TextStyle get textSemiBold => const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'SFProDisplay');

  TextStyle get textBold => const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'SFProDisplay');
  
  TextStyle get textExtraBold => const TextStyle(fontWeight: FontWeight.w800, fontFamily: 'SFProDisplay');

  TextStyle get textButtonLabel => textMedium.copyWith(fontSize: 19, color: Colors.white);

  TextStyle get textPrimaryButtonLabel => textMedium.copyWith(fontSize: 19, color: ColorsApp.instance.primary);

  TextStyle get textSecondaryButtonLabel => textMedium.copyWith(fontSize: 18, color: ColorsApp.instance.secondary);

  TextStyle get textTitle => textBold.copyWith(fontSize: 29, color: Colors.black);

  TextStyle get textTitleItemList => textMedium.copyWith(fontSize: 17, color: Colors.black);

  TextStyle get textSubTitleItemList => textRegular.copyWith(fontSize: 15, color: Colors.black54);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
