  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import '../style/color_style_features.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';

  class CustomCard extends StatelessWidget {

    final String sectionName;
    final String sectionStatus;
    TextStyleFeatures textStyleFeatures = TextStyleFeatures();
     CustomCard({super.key,
      required this.sectionName,
      required this.sectionStatus,
    });

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          Get.toNamed('/section-details', arguments: {
            'name': sectionName,
            'status': sectionStatus,
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: ColorStyleFeatures.cardColor, // Use the extracted color constant
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double availableWidth = constraints.maxWidth;
              final double availableHeight = constraints.maxHeight;
              final double cardPadding = availableWidth * ConstraintStyleFeatures.cardPaddingRatio; // Use the extracted constraint constant

              return Container(

                padding: EdgeInsets.all(cardPadding),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sectionName,
                      style: textStyleFeatures.cardTitleTextStyle(availableWidth, true),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: availableHeight * ConstraintStyleFeatures.cardVerticalSpacingRatio), // Use the extracted constraint constant
                    Text(
                      sectionStatus,
                      style: textStyleFeatures.cardTitleTextStyle(availableWidth, false),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }