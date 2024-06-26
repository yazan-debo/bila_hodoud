import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/global_interface_controller.dart';
import '../style/constraint_style_features.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_side_bar.dart';

class GlobalInterface extends StatelessWidget {
  const GlobalInterface({super.key});

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
                dropdowns: Get.put(GlobalInterfaceController()).dropdowns,
                loggedInUser: 'yazan',
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    const SizedBox(height: ConstraintStyleFeatures.spaceBetweenElements),
                    ...Get.put(GlobalInterfaceController()).extraWidgets,
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