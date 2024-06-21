import 'package:flutter/material.dart';

import '../style/text_style_features.dart';

class UsedFilled extends StatelessWidget {
  final String label;
  final bool isMandatory;
  final Function(String)? onChanged;

  const UsedFilled({
    required this.label,
    required this.isMandatory,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final Size screenSize = MediaQuery.of(context).size;
    final double screenSpace = screenSize.height * screenSize.width;

    return Row(
      children: [
        Text(
          label,
          style: TextStyleFeatures.generalTextStyle,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(width: 25),
        SizedBox(
          width: screenSpace * 0.0004, // Set the desired width of the TextField
          child: TextField(
            controller: textController,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'أدخل $label',
              hintStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(width: 20),
        if (isMandatory)
          const Text(
            '*',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
            ),
            textDirection: TextDirection.rtl,
          ),
      ],
    );
  }
}