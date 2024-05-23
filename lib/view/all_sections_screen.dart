import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_sections_controller.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_side_bar.dart';
import '../widgets/most_used_button.dart';


class AllSectionsScreen extends StatelessWidget {
  final AllSectionsController controller = Get.put(AllSectionsController());

  AllSectionsScreen({super.key, });

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomSidebar(
                dropdowns: controller.dropdowns,
                loggedInUser: 'John Doe',
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                    Center(
                      child: Text(
                        'الأقسام الموجودة حالياً',
                        style: TextStyleFeatures.generalTextStyle,
                      ),
                    ),
                    const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
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
                          itemCount: controller.cards.length,
                          itemBuilder: (context, index) {
                            final product = controller.cards[index];
                            return CustomCard(
                              sectionName: product.sectionName,
                              sectionStatus: product.sectionStatus,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                    MostUsedButton(
                      buttonText: 'أضف قسما جديدا',
                      buttonIcon: Icons.add_circle_outline,
                      route: 'settings',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}