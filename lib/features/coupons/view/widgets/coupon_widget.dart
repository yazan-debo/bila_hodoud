import 'package:bila_hodoud/features/coupons/view/pages/coupon_details_screen.dart';
import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/view/pages/libraries_screen.dart';
import 'package:bila_hodoud/features/libraries/view/pages/modify_library_screen.dart';
import 'package:bila_hodoud/features/sections/model/params/section_params.dart';
import 'package:bila_hodoud/features/sections/view/pages/modify_section_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/switch_button.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../core/constants/style/text_style_features.dart';

import '../../../../core/components/custom_button.dart';
import '../../model/coupon_model.dart';

class CouponWidget extends StatefulWidget {
  final CouponModel coupon;

  const CouponWidget({
    super.key,
    required this.coupon,
  });

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CouponDetailsScreen(
              coupon: widget.coupon,
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: ColorStyleFeatures.cardColor,
        // Use the extracted color constant
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double availableWidth = constraints.maxWidth;
            final double availableHeight = constraints.maxHeight;
            final double cardPadding = availableWidth *
                ConstraintStyleFeatures
                    .cardPaddingRatio; // Use the extracted constraint constant

            return Center(
              child: Container(
                padding: EdgeInsets.all(cardPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.coupon.sender ?? ""}               --->",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.coupon.receiver ?? "",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
