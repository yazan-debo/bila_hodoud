import 'package:flutter/material.dart';

import 'edit_button.dart';

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
        _buildTableRow(
          'حالة الدور',
          'اسم الدور',
          'تعديل الدور' as Widget,
          isHeader: true,
        ),
        ...data.entries.map((entry) {
          final roleName = entry.key;
          final status = entry.value;
          return _buildTableRow(
            status ? 'فعال' : 'غير فعال',
            roleName,
            const EditButton(),
          );
        }).toList(),
      ],
    );
  }

  TableRow _buildTableRow(String cell1Text, String cell2Text, Widget cell3Widget,
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
            child: Text(cell1Text, style: textStyle),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(cell2Text, style: textStyle),
          ),
        ),
        TableCell(
          child: Center(
            child: cell3Widget,
          ),
        ),
      ],
    );
  }
}