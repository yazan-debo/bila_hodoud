import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/style/color_style_features.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: EdgeInsets.all(20.px),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.px),
            color: ColorStyleFeatures.headLinesTextColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(30.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                  ),
                  child: Icon(
                    Icons.document_scanner_sharp,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                  ),
                  child: Center(
                      child: Text(
                    "اسم المنتج",
                    style: TextStyle(color: Colors.white, fontSize: 20.px),
                  )),
                ),
              ],
            ),
          )),
    );
  }
}
