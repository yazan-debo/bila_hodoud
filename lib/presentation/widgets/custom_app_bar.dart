import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key});

  final RxBool isHovered1 = false.obs;
  final RxBool isHovered2 = false.obs;
  final RxBool isHovered3 = false.obs;
  double availableWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          availableWidth = constraints.maxWidth;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: ConstraintStyleFeatures.appBarPaddingValue(availableWidth)),
              Expanded(
                child: buildNavItem(
                  'الرئيسية',
                  '/home',
                  isHovered1,
                  ConstraintStyleFeatures.appBarFontSize(availableWidth),
                ),
              ),
              Expanded(
                child: buildNavItem(
                  'الإعدادات',
                  '/settings',
                  isHovered2,
                  ConstraintStyleFeatures.appBarFontSize(availableWidth),
                ),
              ),
              Expanded(
                child: buildNavItem(
                  'تسجيل الخروج',
                  '/logout',
                  isHovered3,
                  ConstraintStyleFeatures.appBarFontSize(availableWidth) / 1.02,
                ),
              ),
              Spacer(),
              SizedBox(width: ConstraintStyleFeatures.appBarPaddingValue(availableWidth)),
              Container(
                width: ConstraintStyleFeatures.appBarLogoSize(availableWidth),
                height: ConstraintStyleFeatures.appBarLogoSize(availableWidth),
                child: GestureDetector(
                  onTap: () {
                    // Handle logo tap
                  },
                  child: LogoImage(),
                ),
              ),
              SizedBox(width: ConstraintStyleFeatures.appBarPaddingValue(availableWidth)),
            ],
          );
        },
      ),
    );
  }

  Widget buildNavItem(
      String text,
      String route,
      RxBool isHovered,
      double fontSize,
      ) {
    return Obx(
          () => MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        cursor: isHovered.value ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: () {
            Get.offAllNamed(route);
          },
          child: Text(
            text,
            style: TextStyleFeatures.appBarTextStyle(availableWidth, isHovered.value),
          ),
        ),
      ),
    );
  }
}