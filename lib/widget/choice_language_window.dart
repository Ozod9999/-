import 'package:flutter/material.dart';
import 'package:flutter_application_work/theme/app_Colors/app_colors.dart';

////--- окно виджет выбора языка перед расчётом ---\\\\

String languagelistValue = '  language  ';

class ChoiceLanguage extends StatefulWidget {
  const ChoiceLanguage({Key? key}) : super(key: key);

  @override
  State<ChoiceLanguage> createState() => _ChoiceLanguageState();
}

class _ChoiceLanguageState extends State<ChoiceLanguage> {
  void _next() {
    switch (languagelistValue) {
      case '  language  ':
        null;
        break;
      case ' Русский ':
        Navigator.of(context).pushReplacementNamed('/canculate_window');
        break;
      case ' English ':
        null;
        break;
      case ' O`zbek ':
        null;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.orange,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainDarkGreen,
        onPressed: _next,
        child: const Text('Next'),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.mainDarkGreen,
        title: const Center(
          child: Text('Kredit calculator'),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Choice your language',
            style: textStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ChoiceLanguageWidget(),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class ChoiceLanguageWidget extends StatefulWidget {
  const ChoiceLanguageWidget({Key? key}) : super(key: key);

  @override
  _ChoiceLanguageWidgetState createState() => _ChoiceLanguageWidgetState();
}

class _ChoiceLanguageWidgetState extends State<ChoiceLanguageWidget> {
  // ========== Hozircha faqat rus tili mavjud  ========
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: DropdownButton<String>(
              dropdownColor: AppColors.mainDarkGreen,
              borderRadius: BorderRadius.circular(5),
              value: languagelistValue,
              iconSize: 30,
              elevation: 10,
              icon: const Icon(Icons.dehaze_outlined),
              style: const TextStyle(color: Colors.black),
              underline: Container(
                width: 50,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  languagelistValue = newValue!;
                });
              },
              items: <String>[
                '  language  ',
                ' English ',
                ' Русский ',
                ' O`zbek '
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList()),
        ),
      ],
    );
  }
}
