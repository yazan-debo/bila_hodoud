import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controllers/global_interface_controller.dart';
import '../style/text_style_features.dart';
import '../widgets/used_filled.dart';
import 'global_interface.dart';

class AddNewSection extends StatelessWidget {
  const AddNewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController =
        Get.put(GlobalInterfaceController());
    globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          'إضافة قسم جديد',
          style: TextStyleFeatures.generalTextStyle,
        ),
      ),
    );

    globalInterfaceController.addExtraWidget(UsedFilled('User Name', true));
    return const GlobalInterface();
  }
}
