import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/style/color_style_features.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/pending_orders_details');
      },
      child: Container(
          margin: EdgeInsets.all(20.px),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.px),
            color: ColorStyleFeatures.headLinesTextColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(30.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
