import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {

  const CustomNavbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Get.offAllNamed('/home');
            },
            child: Text(
              'الرئيسية',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Get.offAllNamed('/settings');
            },
            child: Text(
              'الإعدادات',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Get.offAllNamed('/logout');
            },
            child: Text(
              'تسجيل الخروج',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}