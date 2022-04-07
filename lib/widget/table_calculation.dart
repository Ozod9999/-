import 'package:flutter/material.dart';
import 'package:flutter_application_work/logic_calculate/kredi_cal_logic.dart';
import '../theme/app_Colors/app_colors.dart';


var textStile = const TextStyle(
   fontSize: 15, 
   color: Colors.white,);
class TableCalculation extends StatefulWidget {
  const TableCalculation({Key? key}) : super(key: key);

  @override
  _TableCalculationState createState() => _TableCalculationState();
}

class _TableCalculationState extends State<TableCalculation> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.mainDarkGreen,
      elevation: 15,
      shadowColor: AppColors.mainDarkGreen,
      child: SingleChildScrollView(
        child: DataTable(
          border: const TableBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),),
            horizontalInside: BorderSide(color: Colors.white), 
            verticalInside: BorderSide(color: Colors.white),),
          dividerThickness: 2,
          horizontalMargin: 5,
          columnSpacing: 20,
          columns: [
            DataColumn(
              label: Text('Месяц', style: textStile),
            ),
            DataColumn(
              label: Text('сумма остатка', style: textStile),
            ),
            DataColumn(
              label: Text('Процент', style: textStile),
              ),
            DataColumn(
              label: Text('Оплата', style: textStile),
              ),
          ],
          rows: [
            for (var i = 0; i < items.length; i++)
                DataRow(cells: [
                  DataCell(Text(' ${items[i]}', style: textStile)),
                  DataCell(Text('${itemsDebt[i]}', style: textStile)),
                  DataCell(Text('${itemsDebtPros[i]}', style: textStile)),
                  DataCell(Text('${itemsPayment[i]}', style: textStile)),
                ]),
          ],
        ),
      ),
    );
  }
}
