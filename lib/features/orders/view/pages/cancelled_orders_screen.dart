import 'dart:js_interop';

import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/view/pages/modify_library_screen.dart';
import 'package:bila_hodoud/features/orders/controller/normal_orders_controller.dart';
import 'package:bila_hodoud/features/orders/view/widgets/normal_order_widget.dart';
import 'package:bila_hodoud/features/sections/view/pages/modify_section_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/components/most_used_button.dart';
import '../../../../../core/components/retry_widget.dart';
import '../../../../../core/constants/style/color_style_features.dart';
import '../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../core/constants/style/text_style_features.dart';
import '../../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../../presentation/view/global_interface.dart';

class CancelledOrdersScreen extends StatefulWidget {
  const CancelledOrdersScreen({super.key});

  @override
  State<CancelledOrdersScreen> createState() => _CancelledOrdersScreenState();
}

class _CancelledOrdersScreenState extends State<CancelledOrdersScreen> {
  final NormalOrdersController? normalOrdersController =
      Get.find<NormalOrdersController>();

  @override
  void initState() {
    // TODO: implement initState
    normalOrdersController?.getDeliveryOrders();
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
          'الطلبات اللتي تم إلغاؤها',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      Expanded(
        child: normalOrdersController!.obx(
            (state) => GridView.builder(
                  padding:
                      EdgeInsets.all(ConstraintStyleFeatures.gridsPadding()),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: state?.length ?? 0,
                  itemBuilder: (context, index) {
                    return NormalOrderWidget(
                      order: state![index],
                    );
                  },
                ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onEmpty: Center(
              child: RetryWidget(
                  error: "لا يوجد نتائج",
                  func: () => normalOrdersController?.getDeliveryOrders()),
            ),
            onError: (error) => Center(
                  child: RetryWidget(
                      error: error!,
                      func: () => normalOrdersController?.getDeliveryOrders()),
                )),
      ),
    );

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    return GlobalInterface();
  }
}
