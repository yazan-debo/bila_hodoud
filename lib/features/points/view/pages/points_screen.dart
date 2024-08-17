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
import '../../controller/points_controller.dart';
import '../widgets/point_widget.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  final PointsController? pointsController = Get.find<PointsController>();

  @override
  void initState() {
    // TODO: implement initState
    pointsController?.getPoints(true);
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
          'نقاط المستخدمين',
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      Expanded(
        child: pointsController!.obx(
            (state) => ListView.builder(
                  padding:
                      EdgeInsets.all(ConstraintStyleFeatures.gridsPadding()),
                  shrinkWrap: true,
                  itemCount: state?.length ?? 0,
                  itemBuilder: (context, index) {
                    return PointWidget(
                      point: state![index],
                    );
                  },
                ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onEmpty: Center(
              child: RetryWidget(
                  error: "لا يوجد نتائج",
                  func: () => pointsController?.getPoints(true)),
            ),
            onError: (error) => Center(
                  child: RetryWidget(
                      error: error!,
                      func: () => pointsController?.getPoints(true)),
                )),
      ),
    );

    return GlobalInterface();
  }
}
