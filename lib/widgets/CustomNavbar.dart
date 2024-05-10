import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key});

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double fontSize = constraints.maxWidth * 0.03; // Calculate the font size based on available width
          final double logoSize = constraints.maxWidth * 0.15; // Calculate the logo size based on available width
          final double paddingValue = constraints.maxWidth * 0.05; // Calculate the padding value based on available width

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: paddingValue),
              Expanded(
                child: buildNavItem(
                  'الرئيسية',
                  '/home',
                  isHovered1,
                      () => setState(() => isHovered1 = true),
                      () => setState(() => isHovered1 = false),
                  fontSize,
                ),
              ),
              Expanded(
                child: buildNavItem(
                  'الإعدادات',
                  '/settings',
                  isHovered2,
                      () => setState(() => isHovered2 = true),
                      () => setState(() => isHovered2 = false),
                  fontSize,
                ),
              ),
              Expanded(
                child: buildNavItem(
                  'تسجيل الخروج',
                  '/logout',
                  isHovered3,
                      () => setState(() => isHovered3 = true),
                      () => setState(() => isHovered3 = false),
                  fontSize / 1.02,
                ),
              ),
              Spacer(),
              SizedBox(width: paddingValue),
              Container(
                width: logoSize,
                height: logoSize,
                child: GestureDetector(
                  onTap: () {
                    // Handle logo tap
                  },
                  child: Image.asset(
                    'web/icons/logo.jfif',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: paddingValue),
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
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: isHovered ? Colors.amber : Colors.transparent,
            decorationThickness: 0.5, // Increase the decoration thickness for more spacing
            color: isHovered ? Colors.amber : Colors.black,
          ),
        ),
      ),
    );
  }
}