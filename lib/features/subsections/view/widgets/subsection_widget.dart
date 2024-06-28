import 'package:bila_hodoud/features/subsections/controller/subsection_controller.dart';
import 'package:bila_hodoud/features/subsections/model/models/subsection_model.dart';
import 'package:bila_hodoud/features/subsections/view/pages/modify_subsection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../core/constants/style/text_style_features.dart';

class SubSectionWidget extends StatefulWidget {
  final SubsectionModel subsection;
  final int sectionId;
  final Function onDelete;

  SubSectionWidget(
      {super.key,
      required this.subsection,
      required this.onDelete,
      required this.sectionId});

  @override
  State<SubSectionWidget> createState() => _SubSectionWidgetState();
}

class _SubSectionWidgetState extends State<SubSectionWidget> {
  final SubsectionsController? subsectionsController =
      Get.find<SubsectionsController>();
  TextStyleFeatures textStyleFeatures = TextStyleFeatures();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: ColorStyleFeatures.cardColor,
        // Use the extracted color constant
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double availableWidth = constraints.maxWidth;
            final double availableHeight = constraints.maxHeight;
            final double cardPadding = availableWidth *
                ConstraintStyleFeatures
                    .cardPaddingRatio; // Use the extracted constraint constant

            return Stack(
              children: [
                Center(
                    child: Container(
                  padding: EdgeInsets.all(cardPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.subsection.name ?? "",
                        style: textStyleFeatures.cardTitleTextStyle(
                            availableWidth, true),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(
                        icon: Icons.edit,
                        backgroundColor: ColorStyleFeatures.headLinesTextColor,
                        onTap: () {
                          Get.to(() => ModifySubsectionScreen(
                                subsection: widget.subsection,
                                sectionId: widget.sectionId,
                              ));
                        },
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      CustomButton(
                        icon: Icons.delete,
                        backgroundColor: Colors.red[600]!,
                        onTap: () async {
                          bool? isSuccess = await subsectionsController
                              ?.deleteSubsection(widget.subsection.id ?? 0);
                          if (isSuccess ?? false) {
                            widget.onDelete();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
