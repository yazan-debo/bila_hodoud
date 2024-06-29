import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/style/color_style_features.dart';
import '../constants/style/text_style_features.dart';

class CustomDropdownList extends StatefulWidget {
  final String label;
  final String hint;
  final List<DropdownMenuItem<int>>? items;
  final dynamic selectedItem;
  final Function(dynamic value) onChanged;

  const CustomDropdownList(
      {super.key,
      required this.label,
      required this.hint,
      this.items,
      this.selectedItem,
      required this.onChanged});

  @override
  State<CustomDropdownList> createState() => _CustomDropdownListState();
}

class _CustomDropdownListState extends State<CustomDropdownList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          style: TextStyleFeatures.generalTextStyle,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(width: 25),
        Container(
          height: 8.h,
          width: 100.w * 100.h * 0.0004,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorStyleFeatures.headLinesTextColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<int>(
            hint: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.hint,
                style: TextStyle(fontSize: 14.px),
              ),
            ),
            underline: Container(),
            value: widget.selectedItem,
            onChanged: (int? selectedItem) {
              widget.onChanged(selectedItem);
            },
            items: widget.items?.toList(),
          ),
        ),
      ],
    );
  }
}
