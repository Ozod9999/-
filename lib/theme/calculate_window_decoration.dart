import 'package:flutter/material.dart';
import 'package:flutter_application_work/theme/app_Colors/app_colors.dart';
import 'package:flutter_application_work/widget/window_calculate.dart';
import 'package:flutter_application_work/logic_calculate/kredi_cal_logic.dart';

class CreditCalcRusWidget extends StatefulWidget {
  const CreditCalcRusWidget({Key? key}) : super(key: key);

  @override
  State<CreditCalcRusWidget> createState() => _CreditCalcRusWidgetState();
}

class _CreditCalcRusWidgetState extends State<CreditCalcRusWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainDarkGreen,
        title: const Center(child: Text('Кредитный калькулятор')),
      ),
      body: ListView(
        children: const [
          CalculateDecoration(),
        ],
      ),
    );
  }
}

class CalculateDecoration extends StatefulWidget {
  const CalculateDecoration({Key? key}) : super(key: key);

  @override
  _CalculateDecorationState createState() => _CalculateDecorationState();
}

class _CalculateDecorationState extends State<CalculateDecoration> {
  final _model = SimpleCalcWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SimpleCalcWidgetProvider(
          model: _model,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(height: 30),
                Text(
                  'Сумма кредита',
                  style: TextStyle(color: AppColors.mainDarkGreen),
                ),
                SizedBox(height: 10),
                SumKredWidget(),
                SizedBox(height: 20),
                Text(
                  'Срок кредита',
                  style: TextStyle(color: AppColors.mainDarkGreen),
                ),
                SizedBox(height: 10),
                PeriodWidget(),
                SizedBox(height: 20),
                Text(
                  'Годовая процентная ставка',
                  style: TextStyle(color: AppColors.mainDarkGreen),
                ),
                SizedBox(height: 10),
                ProcentWidget(),
                SizedBox(height: 10),
                Text(
                  'Выберите способ расчёта',
                  style: TextStyle(color: AppColors.mainDarkGreen),
                ),
                SizedBox(height: 10),
                ToggleButtonWidget(),
                SizedBox(height: 20),
                ResultWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
