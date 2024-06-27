import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../core/components/most_used_button.dart';
import '../widgets/sys_roles_table.dart';
import '../../../../presentation/view/global_interface.dart';

class SysRolesInterface extends StatelessWidget {
  const SysRolesInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();

    globalInterfaceController.addExtraWidget(
      ResponsiveTable(
        data: {"fff": true},
      ),
    );
    return GlobalInterface();
  }
}
