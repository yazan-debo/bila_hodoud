import 'package:bila_hodoud/style/color_style_features.dart';
import 'package:bila_hodoud/view/all_sections_interface.dart';
import 'package:bila_hodoud/view/global_interface.dart';
import 'package:bila_hodoud/view/home_screen.dart';
import 'package:bila_hodoud/view/login_screen.dart';
import 'package:bila_hodoud/view/section_details_screen.dart';
import 'package:bila_hodoud/view/settings_screen.dart';
import 'package:bila_hodoud/style/text_style_features.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  TextStyleFeatures textStyleFeatures = TextStyleFeatures();

  @override
  Widget build(BuildContext context) {
    final double availableWidth = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App',
      initialRoute: '/all-sections',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
        GetPage(name: '/logout', page: () => LoginScreen()),
        GetPage(name: '/section-details', page: () => SectionDetailsScreen()),
        GetPage(name: '/all-sections', page: () => AllSectionsScreen()),
        GetPage(name: '/sys_roles', page: () => GlobalInterface()),

      ],
      theme: ThemeData(
        cardColor: ColorStyleFeatures.cardColor, // Apply the card color from style features
        textTheme: TextTheme(
          titleLarge: textStyleFeatures.cardTitleTextStyle(availableWidth, true),
          titleMedium: textStyleFeatures.cardTitleTextStyle(availableWidth, false),
        ),
      ),
    );
  }
}