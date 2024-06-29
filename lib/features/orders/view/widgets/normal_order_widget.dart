import 'package:bila_hodoud/features/orders/model/models/normal_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/style/color_style_features.dart';

class NormalOrderWidget extends StatelessWidget {
  final NormalOrderModel order;
  final Function? onTap;

  const NormalOrderWidget({super.key, required this.order, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
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
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          order.id.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.px, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          order.paymentMethod.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.px, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.px),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          order.address.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.px, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.px),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      order.notes.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.px, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
