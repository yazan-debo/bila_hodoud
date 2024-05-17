import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/AllSectionsController.dart';
import '../widgets/CustomCard.dart';
import '../widgets/CustomNavbar.dart';
import '../widgets/CustomSidebar.dart';
import '../widgets/MostUsedButton.dart';


class AllSectionsScreen extends StatelessWidget {
  final AllSectionsController controller = Get.put(AllSectionsController());

  AllSectionsScreen({Key? key});

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
                    CustomNavbar(),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'الأقسام الموجودة حالياً',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF394D96),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Obx(
                            () => GridView.builder(
                          padding: EdgeInsets.all(controller.screenSpace),
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
                    const SizedBox(height: 10),
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