import 'package:flutter/material.dart';
import 'package:flutter_application_work/theme/app_Colors/app_colors.dart';
import 'package:flutter_application_work/theme/calculate_window_decoration.dart';
import 'package:flutter_application_work/widget/choice_language_window.dart';

void main() {
  runApp(const KreditCal());
}

class KreditCal extends StatelessWidget {
  const KreditCal({Key? key}) : super(key: key);

  static const String _title = 'Kredit calсulator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkGreen,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkGreen,
          selectedItemColor: AppColors.mainSelectedItemColor,
          unselectedItemColor: AppColors.mainUnselectedItemColor,
        ),
      ),
      routes: {
        '/choice_language': (context) => const ChoiceLanguage(),
        '/canculate_window': (context) => const CreditCalcRusWidget(),
      },
      initialRoute: '/choice_language',
    );
  }
}
