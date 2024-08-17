import 'dart:js_interop';

import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/view/pages/modify_library_screen.dart';
import 'package:bila_hodoud/features/sections/view/pages/modify_section_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/components/most_used_button.dart';
import '../../../../../../core/components/retry_widget.dart';
import '../../../../../../core/constants/style/color_style_features.dart';
import '../../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../../core/constants/style/text_style_features.dart';
import '../../../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../../../presentation/view/global_interface.dart';
import '../../controller/coupons_controller.dart';
import '../widgets/coupon_widget.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> {
  final CouponsController? couponsController = Get.find<CouponsController>();

  @override
  void initState() {
    // TODO: implement initState
    couponsController?.getCoupons(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          'قسائم المستخدمين',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      Expanded(
        child: couponsController!.obx(
            (state) => ListView.builder(
                  padding:
                      EdgeInsets.all(ConstraintStyleFeatures.gridsPadding()),
                  shrinkWrap: true,
                  itemCount: state?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CouponWidget(
                      coupon: state![index],
                    );
                  },
                ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onEmpty: Center(
              child: RetryWidget(
                  error: "لا يوجد نتائج",
                  func: () => couponsController?.getCoupons(true)),
            ),
            onError: (error) => Center(
                  child: RetryWidget(
                      error: error!,
                      func: () => couponsController?.getCoupons(true)),
                )),
      ),
    );

    return GlobalInterface();
  }
}
