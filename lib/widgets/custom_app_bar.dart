import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  double availableWidth = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          availableWidth = constraints.maxWidth;
         /* final double logoSize = constraints.maxWidth * 0.15;
*/
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: ConstraintStyleFeatures.appBarPaddingValue(availableWidth)),
              Expanded(
                child: buildNavItem(
                  'الرئيسية',
                  '/home',
                  isHovered1,
                      () => setState(() => isHovered1 = true),
                      () => setState(() => isHovered1 = false),
                  ConstraintStyleFeatures.appBarFontSize(availableWidth)
                ),
              ),
              Expanded(
                child: buildNavItem(
                  'الإعدادات',
                  '/settings',
                  isHovered2,
                      () => setState(() => isHovered2 = true),
                      () => setState(() => isHovered2 = false),
                    ConstraintStyleFeatures.appBarFontSize(availableWidth)
                ),
              ),
              Expanded(
                child: buildNavItem(
                  'تسجيل الخروج',
                  '/logout',
                  isHovered3,
                      () => setState(() => isHovered3 = true),
                      () => setState(() => isHovered3 = false),
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
      bool isHovered,
      VoidCallback onEnter,
      VoidCallback onExit,
      double fontSize,
      ) {
    return MouseRegion(
      onEnter: (event) => onEnter(),
      onExit: (event) => onExit(),
      cursor: isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () {
          Get.offAllNamed(route);
        },
        child: Text(
          text,
          style: TextStyleFeatures.appBarTextStyle(availableWidth , isHovered),
        ),
      ),
    );
  }
}