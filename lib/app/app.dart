import 'package:flutter/material.dart';

import '../config/theme/settings_theme.dart';
import '../pages/categoria/categoria_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      theme: SettingsTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const CategoriaPage(),
      // routes: RotasApp.routes,
    );
  }
}
