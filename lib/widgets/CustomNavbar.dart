import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 16),
          FlutterLogo(size: 40),
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