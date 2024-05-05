import 'package:flutter/material.dart';

import '../widgets/CustomCard.dart';
import '../widgets/CustomDropdown.dart';

class AllSectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Sections'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomDropdown(
                    name: 'Dropdown List 1',
                    choices: ['Choice 1', 'Choice 2', 'Choice 3'],
                  ),
                  SizedBox(height: 10),
                  CustomDropdown(
                    name: 'Dropdown List 2',
                    choices: ['Choice 1', 'Choice 2', 'Choice 3'],
                  ),
                  SizedBox(height: 10),
                  CustomDropdown(
                    name: 'Dropdown List 3',
                    choices: ['Choice 1', 'Choice 2', 'Choice 3'],
                  ),
                  SizedBox(height: 10),
                  CustomDropdown(
                    name: 'Dropdown List 4',
                    choices: ['Choice 1', 'Choice 2', 'Choice 3'],
                  ),
                  SizedBox(height: 10),
                  CustomDropdown(
                    name: 'Dropdown List 5',
                    choices: ['Choice 1', 'Choice 2', 'Choice 3'],
                  ),
                  SizedBox(height: 10),
                  CustomDropdown(
                    name: 'Dropdown List 6',
                    choices: ['Choice 1', 'Choice 2', 'Choice 3'],
                  ),                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الأقسام الموجودة حالياً',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomCard(
                    sectionName: 'Section 1',
                    sectionStatus: 'Status 1',
                  ),
                  SizedBox(height: 10),
                  CustomCard(
                    sectionName: 'Section 2',
                    sectionStatus: 'Status 2',
                  ),
                  SizedBox(height: 10),
                  CustomCard(
                    sectionName: 'Section 3',
                    sectionStatus: 'Status 3',
                  ),
                  SizedBox(height: 10),
                  CustomCard(
                    sectionName: 'Section 4',
                    sectionStatus: 'Status 4',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}