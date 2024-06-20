import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsedFilled extends StatelessWidget {
  final String label;
  final bool isMandatory;
  final Function(String)? onChanged;

  UsedFilled(this.label, this.isMandatory, {this.onChanged});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: textController,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'Enter $label',
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        if (isMandatory)
          Text(
            '*',
            style: TextStyle(
              color: Colors.red,
            ),
            textDirection: TextDirection.rtl,
          ),
      ],
    );
  }
}