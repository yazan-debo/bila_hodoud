import 'package:flutter/material.dart';

import '../../../../core/components/edit_button.dart';
import '../../../../core/components/switch_button.dart';

class ResponsiveTable extends StatelessWidget {
  final Map<String, bool> data;

  ResponsiveTable({required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(),
      columnWidths: {
        0: FractionColumnWidth(0.25),
        1: FractionColumnWidth(0.35),
        2: FractionColumnWidth(0.4),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Center(
                child: Text('حالة الدور',
                    style: TextStyle(
                      fontFamily: 'Arabic',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            TableCell(
              child: Center(
                child: Text('اسم الدور',
                    style: TextStyle(
                      fontFamily: 'Arabic',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            TableCell(
              child: Center(
                child: Text('تعديل الدور',
                    style: TextStyle(
                      fontFamily: 'Arabic',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        ),
        ...data.entries.map((entry) {
          final roleName = entry.key;
          final status = entry.value;
          return _buildTableRow(
            status ? 'فعال' : 'غير فعال',
            roleName,
            EditButton(),
          );
        }).toList(),
      ],
    );
  }

  TableRow _buildTableRow(
      String cell1Text, String cell2Text, Widget cell3Widget,
      {bool isHeader = false}) {
    final textStyle = TextStyle(
      fontFamily: 'Arabic',
      fontSize: isHeader ? 16 : 14,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
    );

    return TableRow(
      decoration: isHeader ? null : BoxDecoration(color: Colors.grey[200]),
      children: [
        TableCell(
          child: Center(
            child: Row(
              children: [
                Text(cell1Text, style: textStyle),
                SwitchButton(
                  initStatus: true,
                  onChange: (v) {},
                )
              ],
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(cell2Text, style: textStyle),
          ),
        ),
        TableCell(child: cell3Widget),
      ],
    );
  }
}
