import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionDetailsScreen extends StatelessWidget {
  const SectionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> sectionData = Get.arguments as Map<String, dynamic>;
    final String sectionName = sectionData['name'];
    final String sectionStatus = sectionData['status'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Section Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Section Name: $sectionName'),
            const SizedBox(height: 16),
            Text('Section Status: $sectionStatus'),
          ],
        ),
      ),
    );
  }
}