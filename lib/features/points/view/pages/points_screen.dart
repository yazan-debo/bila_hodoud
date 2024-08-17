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
import '../../../../core/components/edit_button.dart';
import '../../controller/points_controller.dart';
import '../../model/point_model.dart';
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
                  (state) => Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                columnWidths: const {
                  0: FractionColumnWidth(0.5),
                  1: FractionColumnWidth(0.5),

                },
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: Text('اسم الزبون',
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
                          child: Text('عدد النقاط',
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

                    );
                  }),
                ],
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
        )








    );

    return GlobalInterface();
  }



  TableRow _buildTableRow(
      PointModel point,


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
                child: Text(point.name ?? "", style: textStyle),
              )),
        ),
        TableCell(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(point.points.toString() ?? "", style: textStyle),
              )),
        ),

      ],
    );
  }
}
