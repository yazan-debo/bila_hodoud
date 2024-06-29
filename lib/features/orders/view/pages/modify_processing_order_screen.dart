import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/orders/controller/normal_orders_controller.dart';
import 'package:bila_hodoud/features/orders/model/models/normal_order_model.dart';
import 'package:bila_hodoud/features/orders/view/widgets/normal_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/used_filled.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../core/constants/style/text_style_features.dart';

import '../../../../presentation/controllers/global_interface_controller.dart';

import '../../../../core/components/most_used_button.dart';

import '../../../../presentation/view/global_interface.dart';
import '../../controller/status_dropdown_controller.dart';
import '../../model/params/processing_order_params.dart';

class ModifyProcessingOrderScreen extends StatefulWidget {
  final NormalOrderModel? order;
  final int pageIndex;

  const ModifyProcessingOrderScreen(
      {super.key, this.order, required this.pageIndex});

  @override
  State<ModifyProcessingOrderScreen> createState() =>
      _ModifyProcessingOrderScreenState();
}

class _ModifyProcessingOrderScreenState
    extends State<ModifyProcessingOrderScreen> {
  final NormalOrdersController? normalOrdersController =
      Get.find<NormalOrdersController>();
  final StatusDropdownController? statusDropdownController =
      Get.find<StatusDropdownController>();
  final _processingOrderFromKey = GlobalKey<FormState>();
  ProcessingOrderParams params = ProcessingOrderParams();
  TextEditingController deliveryMethod = TextEditingController();
  TextEditingController deliveryCost = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.order != null) {
      deliveryMethod.text = widget.order?.paymentMethod ?? "";
    }

    statusDropdownController?.change("قيد المعالجة");

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
          "تعديل طلب",
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Form(
      key: _processingOrderFromKey,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsedFilled(
              label: 'طريقة التوصيل',
              controller: deliveryMethod,
              isMandatory: true,
              onSaved: (value) {
                params.deliveryMethod = value;
              },
            ),
            UsedFilled(
              label: 'كلفة التوصيل',
              controller: deliveryCost,
              isMandatory: true,
              onSaved: (value) {
                params.deliveryCost = value;
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            Obx(() => Row(
                  children: [
                    Text(
                      "حالة الطلب",
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
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "حالة الطلب",
                            style: TextStyle(fontSize: 14.px),
                          ),
                        ),
                        underline: Container(),
                        value: statusDropdownController?.selectedItem.value,
                        onChanged: (String? selectedItem) {
                          statusDropdownController?.change(selectedItem ?? "");
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: "في طريقه إليك",
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "في طريقه إليك",
                                style: TextStyle(fontSize: 18.px),
                              ),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "قيد المعالجة",
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "قيد المعالجة",
                                style: TextStyle(fontSize: 18.px),
                              ),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "تم تنفيذه",
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "تم تنفيذه",
                                style: TextStyle(fontSize: 18.px),
                              ),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "تم إلغاؤه",
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "تم إلغاؤه",
                                style: TextStyle(fontSize: 18.px),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      MostUsedButton(
        buttonText: 'حفظ',
        buttonIcon: Icons.save,
        onTap: () {
          if (_processingOrderFromKey.currentState!.validate()) {
            _processingOrderFromKey.currentState?.save();

            normalOrdersController?.updateOrder(
                widget.order?.id ?? 0, params, widget.pageIndex);
          }
        },
      ),
    );
    return const GlobalInterface();
  }
}
