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
        child: ListTile(
          title: Text(sectionName),
          subtitle: Text(sectionStatus),
        ),
      ),
    );
  }
}
