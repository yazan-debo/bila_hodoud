import 'package:bila_hodoud/view/AllSectionsScreen.dart';
import 'package:bila_hodoud/view/HomeScreen.dart';
import 'package:bila_hodoud/view/LoginScreen.dart';
import 'package:bila_hodoud/view/SectionDetailsScreen.dart';
import 'package:bila_hodoud/view/SettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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



      ],
      theme: ThemeData(
        // Your app theme
      ),
    );
  }
}




