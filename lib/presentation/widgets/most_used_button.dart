import 'package:bila_hodoud/data/datasources/api/section_api.dart';
import 'package:bila_hodoud/data/repositories/section_repository_impl.dart';
import 'package:bila_hodoud/domain/entities/section.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/section_repository.dart';
import '../../domain/usecases/section_use_cases.dart';
import '../controllers/most_used_button_controller.dart';
import '../style/color_style_features.dart';
import '../style/constraint_style_features.dart';
import '../style/text_style_features.dart';

class MostUsedButton extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final String route;
  final MostUsedButtonController
      buttonController; // Declare buttonController as a member

  MostUsedButton({
    Key? key,
    required this.buttonText,
    this.buttonIcon,
    required this.route,
  })  : buttonController = MostUsedButtonController(route: route),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstraintStyleFeatures constraintStyleFeatures = ConstraintStyleFeatures();

    SectionApi sectionApi = SectionApi();
    final SectionRepository sectionRepository = SectionRepositoryImpl(sectionApi);
    final SectionUseCases createNewSection = SectionUseCases(sectionRepository);
    Section section = Section(
        sectionName: "test2",
        sectionDescription: "test",
        sectionStatus: true,
        sectionOrder: 3);

    final Size screenSize = MediaQuery.of(context).size;
    final double screenSpace = screenSize.height * screenSize.width;
    return Container(
      width: constraintStyleFeatures.mostUsedButtonValue(screenSpace, 'W'),
      height: constraintStyleFeatures.mostUsedButtonValue(screenSpace, 'H'),
      child: ElevatedButton(
        onPressed: () async {
          //await createNewSection.editSection(section , 1);

          // sectionRepositoryImpl.addSection(section);
          // Access controller's methods or properties here
           buttonController.navigateToAddSection(); // Use buttonController here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyleFeatures.mostUsedButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Align children in the center vertically
          children: [
            Text(
              buttonText,
              style: TextStyleFeatures.mostUsedButtonTextStyle(screenSpace),
              textDirection: TextDirection
                  .rtl, // Set text direction to right-to-left for Arabic
            ),
            const SizedBox(width: 8), // Add spacing between text and icon
            Icon(
              buttonIcon,
              color: ColorStyleFeatures.inButtonsTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
