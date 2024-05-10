import 'package:flutter/material.dart';

import '../widgets/CustomCard.dart';
import '../widgets/CustomDropdown.dart';
import '../widgets/CustomNavbar.dart';
import '../widgets/CustomSidebar.dart';

class AllSectionsScreen extends StatelessWidget {
  final List<CustomDropdown> dropdowns = [
    CustomDropdown(
      name: 'إدارة الطلبات',
      choices: [
        'طلبات الجملة',
        'طلبات تم إلغاؤها',
        'طلبات في طريقها للزبون',
        'طلبات في الانتظار'
      ],
    ),
    CustomDropdown(
      name: 'إدارة الأقسام',
      choices: ['المنتجات', 'الأقسام'],
    ),
    CustomDropdown(
      name: 'إدارة العروض',
      choices: ['إنشاء عرض جديد', 'العروض الحاليّة'],
    ),
    CustomDropdown(
      name: 'الإدارة المالية',
      choices: ['تقارير عن المبيعات', 'سجلّ المبيعات'],
    ),
    CustomDropdown(
      name: 'إدارة الإشعارات',
      choices: ['إشعارات النظام', 'إشعارات المستخدمين'],
    ),
    CustomDropdown(
      name: 'إدارة الصلاحيات',
      choices: [
        'صلاحيّات الأدوار',
        'أدوار المستخدمين',
        'حسابات المستخدمين',
        'أدوار النظام'
      ],
    ),
  ];

  AllSectionsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        /*appBar: AppBar(
        ),*/
        body: Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomSidebar(dropdowns: dropdowns, loggedInUser: 'John Doe'),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNavbar(),
                    const Text(
                      'الأقسام الموجودة حالياً',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: const [
                          CustomCard(
                            sectionName: 'القسم 1',
                            sectionStatus: 'الحالة 1',
                          ),
                          SizedBox(height: 10),
                          CustomCard(
                            sectionName: 'القسم 2',
                            sectionStatus: 'الحالة 2',
                          ),
                          SizedBox(height: 10),
                          CustomCard(
                            sectionName: 'القسم 3',
                            sectionStatus: 'الحالة 3',
                          ),
                          SizedBox(height: 10),
                          CustomCard(
                            sectionName: 'القسم 4',
                            sectionStatus: 'الحالة 4',
                          ),
                        ],
                      ),
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