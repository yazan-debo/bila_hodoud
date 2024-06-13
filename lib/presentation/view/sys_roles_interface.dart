import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/global_interface_controller.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';
import '../widgets/custom_card.dart';
import '../widgets/most_used_button.dart';
import '../widgets/sys_roles_table.dart';
import 'global_interface.dart';

class SysRolesInterface extends StatelessWidget {
  const SysRolesInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();

    globalInterfaceController.addExtraWidget(
        ResponsiveTable(data: {},),
        );
    return GlobalInterface();
  }
}
