import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/components/custom_dropdown.dart';
import 'dropdown_list_controller.dart';

class GlobalInterfaceController extends GetxController {
  // Reactive properties

  RxList<DropdownListController> dropdowns = <DropdownListController>[].obs;
  final RxList<Widget> extraWidgets = <Widget>[].obs;

  // Fetch data and initialize properties
  @override
  void onInit() {
    super.onInit();

    fetchDropdowns();
  }

  // Simulate fetching dropdowns from an API or database
  void fetchDropdowns() {
    // Replace this with your actual API or database call
    final List<DropdownListController> fetchedDropdowns = [
      DropdownListController(
        name: 'إدارة الطلبات',
        choices: [
          'طلبات تم تنفيذها',
          'طلبات تم إلغاؤها',
          'طلبات في طريقها للزبون',
          'طلبات في الانتظار'
        ],
      ),
      DropdownListController(
        name: 'إدارة الأقسام',
        choices: [
          'الأقسام',
          'المكتبات',
        ],
      ),
      DropdownListController(
        name: 'إدارة العروض',
        choices: ['إنشاء عرض جديد', 'العروض الحاليّة'],
      ),
      DropdownListController(
        name: 'الإدارة المالية',
        choices: ['تقارير عن المبيعات', 'سجلّ المبيعات'],
      ),
      DropdownListController(
        name: 'إدارة الإشعارات',
        choices: ['إشعارات النظام', 'إشعارات المستخدمين'],
      ),
      DropdownListController(
        name: 'إدارة الصلاحيات',
        choices: [
          'صلاحيّات الأدوار',
          'أدوار المستخدمين',
          'حسابات المستخدمين',
          'أدوار النظام'
        ],
      ),
    ];

    dropdowns.value = fetchedDropdowns;
  }

  void addExtraWidget(Widget widget) {
    if (!extraWidgets.contains(widget)) {
      extraWidgets.add(widget);
    }
  }

  void refreshWidget() {
    extraWidgets.clear();
  }

  void removeExtraWidgets() {
    extraWidgets.clear();
  }
}
