import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/news/model/news_model.dart';
import 'package:bila_hodoud/features/permissions/model/models/role_model.dart';
import 'package:bila_hodoud/features/permissions/model/params/role_params.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/components/used_filled.dart';
import '../../../../../core/constants/style/color_style_features.dart';
import '../../../../../core/constants/style/constraint_style_features.dart';
import '../../../../../core/constants/style/text_style_features.dart';

import '../../../../../presentation/controllers/global_interface_controller.dart';

import '../../../../../core/components/most_used_button.dart';

import '../../../../../presentation/view/global_interface.dart';
import '../../../../core/constants/urls.dart';
import '../../../orders/view/widgets/label_widget.dart';
import '../../../products/controller/file_upload_controller.dart';
import '../../../products/model/models/image_file_model.dart';

import '../../model/coupon_model.dart';

class CouponDetailsScreen extends StatefulWidget {
  final CouponModel? coupon;

  const CouponDetailsScreen({super.key, this.coupon});

  @override
  State<CouponDetailsScreen> createState() => _CouponDetailsScreenState();
}

class _CouponDetailsScreenState extends State<CouponDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          "تفاصيل القسيمة",
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWidget(
          label: "المرسل:",
          value: widget.coupon?.sender ?? "",
        ),
        LabelWidget(
          label: "المستقبل:",
          value: widget.coupon?.receiver ?? "",
        ),
        LabelWidget(
          label: "القيمة الكلية:",
          value: widget.coupon?.totalValue.toString() ?? "",
        ),
        LabelWidget(
          label: "القيمة المتبقية:",
          value: widget.coupon?.valueLeft.toString() ?? "",
        ),
        LabelWidget(
          label: "النسبة:",
          value: (widget.coupon?.percentage.toString() ?? "") + "%",
        ),
        LabelWidget(
          label: "القيمة المستهلكة:",
          value: widget.coupon?.valueConsumed.toString() ?? "",
        ),
        LabelWidget(
          label: "تاريخ الإنشاء:",
          value: widget.coupon?.createdAt ?? "",
        ),
      ],
    ));

    return const GlobalInterface();
  }
}
