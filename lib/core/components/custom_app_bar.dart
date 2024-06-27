import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/style/constraint_style_features.dart';
import '../constants/style/text_style_features.dart';
import '../utils/app_shared_pref.dart';

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
              SizedBox(
                  width: ConstraintStyleFeatures.appBarPaddingValue(
                      availableWidth)),
              Expanded(
                child: buildNavItem('الرئيسية', isHovered1,
                    ConstraintStyleFeatures.appBarFontSize(availableWidth), () {
                  Get.offAllNamed("/home");
                }),
              ),
              Expanded(
                child: buildNavItem('الإعدادات', isHovered2,
                    ConstraintStyleFeatures.appBarFontSize(availableWidth), () {
                  Get.offAllNamed("/settings");
                }),
              ),
              Expanded(
                child: buildNavItem(
                    'تسجيل الخروج',
                    isHovered3,
                    ConstraintStyleFeatures.appBarFontSize(availableWidth) /
                        1.02, () {
                  AppSharedPref appSharedPref = AppSharedPref();
                  appSharedPref.deleteAll();
                  Get.offAllNamed("/login");
                }),
              ),
              Spacer(),
              SizedBox(
                  width: ConstraintStyleFeatures.appBarPaddingValue(
                      availableWidth)),
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
              SizedBox(
                  width: ConstraintStyleFeatures.appBarPaddingValue(
                      availableWidth)),
            ],
          );
        },
      ),
    );
  }

  Widget buildNavItem(
      String text, RxBool isHovered, double fontSize, Function onTap) {
    return Obx(
      () => MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        cursor: isHovered.value
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            text,
            style: TextStyleFeatures.appBarTextStyle(
                availableWidth, isHovered.value),
          ),
        ),
      ),
    );
  }
}
