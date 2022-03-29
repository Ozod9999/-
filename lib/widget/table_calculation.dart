import 'package:flutter/material.dart';
import 'package:flutter_application_work/logic_calculate/kredi_cal_logic.dart';
import 'package:flutter_application_work/theme/app_Colors/app_colors.dart';

class TableCalculation extends StatefulWidget {
  const TableCalculation({Key? key}) : super(key: key);

  @override
  _TableCalculationState createState() => _TableCalculationState();
}

class _TableCalculationState extends State<TableCalculation> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: AppColors.mainDarkGreen,
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text('Месяц'),
            ),
            DataColumn(
              label: Text('сумма'),
            ),
            DataColumn(
              label: Text('Процент'),
              ),
            DataColumn(
              label: Text('Оплата'),
              ),
          ],
          rows: [
            for (var i = 0; i < items.length; i++)
                DataRow(cells: [
                  DataCell(Text(' ${items[i]}')),
                  DataCell(Text(' ${itemsDebt[i]}')),
                  DataCell(Text(' ${itemsDebtPros[i]}')),
                  DataCell(Text(' ${itemsPayment[i]}')),
                ]),
          ],
        ),
      ),
    );
  }
}
