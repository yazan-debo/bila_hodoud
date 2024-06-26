import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../style/text_style_features.dart';

class DropdownListController extends GetxController {
  Map<String, String> sideBarRoutesMap = {
    "طلبات الجملة": "",
    "طلبات تم إلغاؤها": "",
    "طلبات في طريقها للزبون": "",
    "طلبات في الانتظار": "",
    "إدارة الأقسام": "",
    "المنتجات": "",
    "الأقسام": "/all-sections",
    "إدارة العروض": "",
    "إنشاء عرض جديد": "",
    "العروض الحاليّة": "",
    "الإدارة المالية": "",
    "تقارير عن المبيعات": "",
    "سجلّ المبيعات": "",
    "إدارة الإشعارات": "",
    "إشعارات النظام": "",
    "إشعارات المستخدمين": "",
    "إدارة الصلاحيات": "",
    "صلاحيّات الأدوار": "",
    "أدوار المستخدمين": "",
    "حسابات المستخدمين": "",
    "أدوار النظام": "/sys_roles",
  };
  final String name;
  final List<String> choices;
  RxBool isExpanded = false.obs;
  RxInt hoveredIndex = (-1).obs;
  RxString selectedChoice = ''.obs;
  TextStyleFeatures textStyleFeatures = TextStyleFeatures();

  DropdownListController({required this.name, required this.choices});

  void setSelectedChoice(String? choice) {
    selectedChoice.value = choice ?? ' ';
    printSelectedChoice();
  }
  String searchInsideBarRoutes(String choice) {
    for (var entry in sideBarRoutesMap.entries) {
      if (entry.key == choice) {
        print("${entry.value}");
        return entry.value;
      }
    }
    return "null";
  }

  void printSelectedChoice() {
    if (kDebugMode) {
      print(selectedChoice.value);
    }
  }
}