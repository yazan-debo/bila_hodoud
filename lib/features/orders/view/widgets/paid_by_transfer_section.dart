import 'package:bila_hodoud/features/orders/controller/normal_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/retry_widget.dart';
import '../pages/modify_processing_order_screen.dart';
import 'normal_order_widget.dart';

class PaidByTransferSection extends StatefulWidget {
  const PaidByTransferSection({super.key});

  @override
  State<PaidByTransferSection> createState() => _PaidByTransferSectionState();
}

class _PaidByTransferSectionState extends State<PaidByTransferSection> {
  final NormalOrdersController? normalOrdersController =
      Get.find<NormalOrdersController>();

  @override
  void initState() {
    // TODO: implement initState
    normalOrdersController?.getPaidByTransferOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.px),
        child: normalOrdersController!.obx(
          (state) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 300.px,
                  childAspectRatio: 1),
              itemCount: state?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return NormalOrderWidget(
                  order: state![index],
                  onTap: () {
                    Get.to(() => ModifyProcessingOrderScreen(
                          pageIndex: 1,
                          order: state[index],
                        ));
                  },
                );
              }),
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: Center(
            child: RetryWidget(
                error: "لا يوجد نتائج",
                func: () => normalOrdersController?.getPaidByTransferOrders()),
          ),
          onError: (error) => Center(
              child: RetryWidget(
                  error: error!,
                  func: () =>
                      normalOrdersController?.getPaidByTransferOrders())),
        ));
  }
}
