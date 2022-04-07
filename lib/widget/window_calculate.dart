// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_work/logic_calculate/kredi_cal_logic.dart';
import 'package:flutter_application_work/theme/app_Colors/app_colors.dart';
import 'package:flutter_application_work/widget/table_calculation.dart';

////==== окно расчёта кредита ====\\\\

var textFildDecor = const InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.mainDarkGreen,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  isCollapsed: true,
);

class SumKredWidget extends StatelessWidget {
  const SumKredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: textFildDecor,
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.sumKred = value,
    );
  }
}

class PeriodWidget extends StatelessWidget {
  const PeriodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: textFildDecor,
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.period = value,
    );
  }
}

class ProcentWidget extends StatelessWidget {
  const ProcentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: textFildDecor,
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.protStavka = value,
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueAnnu = SimpleCalcWidgetProvider.watch(context)?.intPaying ?? ' ';
    final valueDiff =
        SimpleCalcWidgetProvider.watch(context)?.intPayment ?? ' ';
    return Column(
      children: [
        Text('Ежемесяный платёж: $valueAnnu'),
        Text('Ежемесяный платёж: $valueDiff'),
        Center(
          child: CalculateButtonWidget(),
        ),
        SizedBox(
          height: 20,
        ),
        TableCalculation(),
      ],
    );
  }
}

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({Key? key}) : super(key: key);

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

late List<bool> isSelected;
int? choiceCalculate;
var textStile = const TextStyle(fontSize: 15);
class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  void _choiceCalculButton(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
    switch (index) {
      case 0:
        choiceCalculate = 0;
        break;
      case 1:
        choiceCalculate = 1;
        break;
    }
  }

  @override
  void initState() {
    isSelected = [false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        Text('Аннуитетный', style: textStile,),
        Text('  Обычный  ', style: textStile,),
      ],
      borderRadius: BorderRadius.circular(5),
      onPressed: _choiceCalculButton,
      isSelected: isSelected,
      color: AppColors.mainDarkGreen,
      constraints: BoxConstraints(minHeight: 30),
      renderBorder: false,
      selectedColor: Colors.white,
      fillColor: AppColors.mainDarkGreen,
    );
  }
}

class CalculateButtonWidget extends StatelessWidget {
  const CalculateButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.mainDarkGreen),
      ),
      onPressed: () {
        switch (choiceCalculate) {
          case 0:
            SimpleCalcWidgetProvider.read(context)?.recultcalcAnnu();
            break;
          case 1:
            SimpleCalcWidgetProvider.read(context)?.recultcalcDiff();
            break;
        }
      },
      child: const Text('Посчитать'),
    );
  }
}
