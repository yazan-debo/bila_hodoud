import 'package:bila_hodoud/features/authentication/controller/authentication_controller.dart';
import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/libraries/model/params/library_params.dart';
import 'package:bila_hodoud/features/news/model/news_model.dart';
import 'package:bila_hodoud/features/permissions/model/models/role_model.dart';
import 'package:bila_hodoud/features/permissions/model/params/role_params.dart';
import 'package:bila_hodoud/features/reports/controller/reports_controller.dart';
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

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final ReportsController? reportsController = Get.find<ReportsController>();

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          "عرض التقارير",
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    ));

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      MostUsedButton(
        buttonText: 'استيراد',
        buttonIcon: Icons.arrow_circle_down,
        onTap: () async {
          await reportsController?.getReport();
        },
      ),
    );

    return const GlobalInterface();
  }
}
