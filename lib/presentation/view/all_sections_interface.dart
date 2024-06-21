import 'package:bila_hodoud/domain/repositories/section_repository.dart';
import 'package:bila_hodoud/domain/usecases/section_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/datasources/api/section_api.dart';
import '../../data/repositories/section_repository_impl.dart';
import '../controllers/global_interface_controller.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';
import '../widgets/custom_card.dart';
import '../widgets/most_used_button.dart';
import 'global_interface.dart';

class AllSectionsScreen extends StatelessWidget {
  const AllSectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SectionApi sectionApi = SectionApi();
    final SectionRepository sectionRepository = SectionRepositoryImpl(sectionApi);
    final SectionUseCases sectionUseCases = SectionUseCases(sectionRepository);
    sectionUseCases.getAllSections();

    final GlobalInterfaceController globalInterfaceController = Get.put(GlobalInterfaceController());
globalInterfaceController.removeExtraWidgets();
    globalInterfaceController.addExtraWidget(
      Center(
        child: Text(
          'الأقسام الموجودة حالياً',
          style: TextStyleFeatures.headLinesTextStyle,
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
        route: 'addSection',
      ),
    );

    return GlobalInterface();
  }
}