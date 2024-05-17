import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/MostUsedButtonController.dart';

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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final double screenSpace = screenHeight * screenWidth;
    return Container(
          width: screenSpace <= 547184 ? 175 : 250,
          height:screenSpace <= 547184 ? 30 : 50,
          child: ElevatedButton(
            onPressed: () {
              // Access controller's methods or properties here
              buttonController
                  .navigateToAddSection(); // Use buttonController here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF26B7B8),
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
                  style: TextStyle(
                    fontSize: screenSpace <= 547184 ? 13 : 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    color: Colors.white, // Use appropriate Arabic font family
                  ),
                  textDirection: TextDirection
                      .rtl, // Set text direction to right-to-left for Arabic
                ),
                SizedBox(width: 8), // Add spacing between text and icon
                Icon(
                  buttonIcon,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
  }
}
