import 'dart:typed_data';

import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/orders/controller/normal_orders_controller.dart';
import 'package:bila_hodoud/features/orders/controller/status_dropdown_controller.dart';
import 'package:bila_hodoud/features/orders/model/models/normal_order_model.dart';
import 'package:bila_hodoud/features/products/controller/products_controller.dart';
import 'package:bila_hodoud/features/products/model/models/book_model.dart';
import 'package:bila_hodoud/features/products/model/models/game_model.dart';
import 'package:bila_hodoud/features/products/model/models/image_file_model.dart';
import 'package:bila_hodoud/features/products/model/models/product_model.dart';
import 'package:bila_hodoud/features/products/model/params/product_params.dart';
import 'package:bila_hodoud/features/subsections/controller/subsection_controller.dart';
import 'package:bila_hodoud/features/subsections/model/models/subsection_model.dart';
import 'package:bila_hodoud/features/subsections/model/params/subsection_params.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/components/most_used_button.dart';
import '../../../../../core/components/used_filled.dart';
import '../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../core/constants/style/text_style_features.dart';
import '../../../../../core/constants/urls.dart';
import '../../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../../presentation/view/global_interface.dart';
import '../../../../core/components/custom_dropdown_list.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../../model/params/change_status_params.dart';

class ModifyDeliveryOrderScreen extends StatefulWidget {
  final NormalOrderModel order;

  const ModifyDeliveryOrderScreen({super.key, required this.order});

  @override
  State<ModifyDeliveryOrderScreen> createState() =>
      _ModifyDeliveryOrderScreenState();
}

class _ModifyDeliveryOrderScreenState extends State<ModifyDeliveryOrderScreen> {
  final NormalOrdersController? normalOrdersController =
      Get.find<NormalOrdersController>();
  final StatusDropdownController? statusDropdownController =
      Get.find<StatusDropdownController>();

  ChangeStatusParams params = ChangeStatusParams();

  @override
  void initState() {
    // TODO: implement initState
    statusDropdownController?.change("في طريقه إليك");
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
          "تعديل حالة الطلب",
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        onTap: () async {
          params.status = statusDropdownController?.selectedItem.value;
          bool? isSuccess = await normalOrdersController?.changeOrderStatus(
              widget.order.id ?? 0, params);
          if (isSuccess ?? false) {
            Get.offNamed("/delivery_orders");
          }
        },
      ),
    );
    return const GlobalInterface();
  }
}
