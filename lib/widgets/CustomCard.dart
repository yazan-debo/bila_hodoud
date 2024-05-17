import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String sectionName;
  final String sectionStatus;

  const CustomCard({
    required this.sectionName,
    required this.sectionStatus,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.toNamed('/section-details', arguments: {
          'name': sectionName,
          'status': sectionStatus,
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color(0xFFE9ECF8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double availableWidth = constraints.maxWidth;
            final double availableHeight = constraints.maxHeight;

            return Container(
              padding: EdgeInsets.all(availableWidth * 0.05), // Adjust padding based on containerWidth

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sectionName,
                    style: TextStyle(
                      fontSize: availableWidth >=260 ? availableWidth * 0.06:availableWidth * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: availableHeight * 0.02),
                  Text(
                    sectionStatus,
                    style: TextStyle(
                      fontSize: availableWidth >=260 ? availableWidth * 0.06:availableWidth * 0.09,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}