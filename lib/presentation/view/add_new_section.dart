import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../controllers/global_interface_controller.dart';
import '../style/constraint_style_features.dart';
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
          style: TextStyleFeatures.headLinesTextStyle,
        ),
      ),
    );
    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );
    globalInterfaceController.addExtraWidget(UsedFilled(
      label: 'اسم القسم',
      isMandatory: true,
      onChanged: (String value) {
        // Handle the entered text here
        print('Entered text: $value');
      },
    ));
    return const GlobalInterface();
  }
}
