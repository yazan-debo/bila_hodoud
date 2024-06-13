import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/global_interface_controller.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';
import '../widgets/custom_card.dart';
import '../widgets/most_used_button.dart';
import 'global_interface.dart';

class AllSectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalInterfaceController globalInterfaceController = Get.put(GlobalInterfaceController());
globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          'الأقسام الموجودة حالياً',
          style: TextStyleFeatures.generalTextStyle,
        ),
      ),
    );

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      Expanded(
        child: Obx(
              () => GridView.builder(
            padding: EdgeInsets.all(ConstraintStyleFeatures.gridsPadding()),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: globalInterfaceController.cards.length,
            itemBuilder: (context, index) {
              final product = globalInterfaceController.cards[index];
              return CustomCard(
                sectionName: product.sectionName,
                sectionStatus: product.sectionStatus,
              );
            },
          ),
        ),
      ),
    );

    globalInterfaceController.addExtraWidget(
      const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
    );

    globalInterfaceController.addExtraWidget(
      MostUsedButton(
        buttonText: 'أضف قسما جديدا',
        buttonIcon: Icons.add_circle_outline,
        route: 'settings',
      ),
    );

    return GlobalInterface();
  }
}