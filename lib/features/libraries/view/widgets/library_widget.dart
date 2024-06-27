import 'package:bila_hodoud/features/libraries/controller/libraries_controller.dart';
import 'package:bila_hodoud/features/libraries/view/pages/libraries_screen.dart';
import 'package:bila_hodoud/features/libraries/view/pages/modify_library_screen.dart';
import 'package:bila_hodoud/features/sections/model/params/section_params.dart';
import 'package:bila_hodoud/features/sections/view/pages/modify_section_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/components/switch_button.dart';
import '../../../../core/constants/style/color_style_features.dart';
import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../core/constants/style/text_style_features.dart';

import '../../../../core/components/custom_button.dart';
import '../../model/models/library_model.dart';

class LibraryWidget extends StatefulWidget {
  final LibraryModel library;
  final Function onDelete;

  const LibraryWidget({
    super.key,
    required this.library,
    required this.onDelete,
  });

  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {
  TextStyleFeatures textStyleFeatures = TextStyleFeatures();
  final LibrariesController? librariesController =
      Get.find<LibrariesController>();

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
                          Get.to(() => ModifyLibraryScreen(
                                library: widget.library,
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
                          bool? isSuccess = await librariesController
                              ?.deleteLibrary(widget.library.id ?? 0);
                          if (isSuccess ?? false) {
                            widget.onDelete();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(cardPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.library.name ?? "",
                          style: textStyleFeatures.cardTitleTextStyle(
                              availableWidth, true),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
