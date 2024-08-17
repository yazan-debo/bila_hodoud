import 'package:bila_hodoud/features/news/model/news_model.dart';
import 'package:bila_hodoud/features/news/view/pages/modify_news_screen.dart';
import 'package:bila_hodoud/features/permissions/controller/roles_controller.dart';
import 'package:bila_hodoud/features/permissions/view/pages/modify_role_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/components/edit_button.dart';
import '../../../../core/components/retry_widget.dart';
import '../../../../core/components/switch_button.dart';
import '../../../../core/constants/style/constraint_style_features.dart';
import '../../../../presentation/controllers/global_interface_controller.dart';
import '../../../../core/components/most_used_button.dart';
import '../../../../presentation/view/global_interface.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() =>
      _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState
    extends State<NotificationsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();

    globalInterfaceController.addExtraWidget(SizedBox());

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      MostUsedButton(
          buttonText: 'حفظ',
          buttonIcon: Icons.add_circle_outline,
          onTap: () {}),
    );
    return GlobalInterface();
  }
}
