import 'dart:js_interop';

import 'package:bila_hodoud/features/coupons/model/coupon_model.dart';
import 'package:bila_hodoud/features/coupons/view/pages/coupon_details_screen.dart';
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
import '../../../../core/components/edit_button.dart';
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

    globalInterfaceController.addExtraWidget(Expanded(
      child: couponsController!.obx(
          (state) => Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                columnWidths: const {
                  0: FractionColumnWidth(0.35),
                  1: FractionColumnWidth(0.35),
                  2: FractionColumnWidth(0.3),
                },
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text('اسم المرسل',
                                style: TextStyle(
                                  fontFamily: 'Arabic',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text('اسم المستقبل',
                              style: TextStyle(
                                fontFamily: 'Arabic',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  ),
                  ...state!.map((item) {
                    return _buildTableRow(
                      item,
                      CellButton(
                        onTap: () {
                          Get.to(() => CouponDetailsScreen());
                        },
                        icon: Icons.remove_red_eye,
                        label: "عرض التفاصيل",
                      ),
                    );
                  }),
                ],
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
    ));

    return GlobalInterface();
  }

  TableRow _buildTableRow(
    CouponModel coupon,
    Widget detailsButton,
  ) {
    final textStyle = TextStyle(
      fontFamily: 'Arabic',
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );

    return TableRow(
      decoration: BoxDecoration(color: Colors.grey[200]),
      children: [
        TableCell(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(coupon.sender ?? "", style: textStyle),
              )),
        ),
        TableCell(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(coupon.receiver.toString() ?? "", style: textStyle),
              )),
        ),
        TableCell(child: detailsButton),
      ],
    );
  }
}
