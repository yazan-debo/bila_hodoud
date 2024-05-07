import 'package:flutter/material.dart';

import '../widgets/CustomCard.dart';
import '../widgets/CustomDropdown.dart';
import '../widgets/CustomNavbar.dart';

class AllSectionsScreen extends StatelessWidget {

  const AllSectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        /*appBar: AppBar(
        ),*/
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFF30377B),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  children: [
                    CustomDropdown(
                      name: 'إدارة الطلبات',
                      choices: ['طلبات الجملة','طلبات تم إلغاؤها', 'طلبات في طريقها للزبون', 'طلبات في الانتظار'],
                    ),
                    SizedBox(height: 10),
                    CustomDropdown(
                      name: 'إدارة الأقسام',
                      choices: ['المنتجات', 'الأقسام'],
                    ),
                    SizedBox(height: 10),
                    CustomDropdown(
                      name: 'إدارة العروض',
                      choices: ['إنشاء عرض جديد', 'العروض الحاليّة'],
                    ),
                    SizedBox(height: 10),
                    CustomDropdown(
                      name: 'الإدارة المالية',
                      choices: ['تقارير عن المبيعات', 'سجلّ المبيعات'],
                    ),
                    SizedBox(height: 10),
                    CustomDropdown(
                      name: 'إدارة الإشعارات',
                      choices: ['إشعارات النظام', 'إشعارات المستخدمين'],
                    ),
                    SizedBox(height: 10),
                    CustomDropdown(
                      name: 'إدارة الصلاحيات',
                      choices: ['صلاحيّات الأدوار','أدوار المستخدمين','حسابات المستخدمين', 'أدوار النظام'],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNavbar (),

                    Text(
                      'الأقسام الموجودة حالياً',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
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
            ),
          ],
        ),
      ),
    );
  }
}