import 'package:get/get.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_dropdown.dart';

class AllSectionsController extends GetxController {
  // Reactive properties
  RxList<CustomCard> cards = <CustomCard>[].obs;
  RxList<CustomDropdown> dropdowns = <CustomDropdown>[].obs;


  // Fetch data and initialize properties
  @override
  void onInit() {
    super.onInit();
    fetchCards();
    fetchDropdowns();
  }

  // Simulate fetching cards from an API or database

  void fetchCards() {
    // Replace this with your actual API or database call
    List<CustomCard> fetchedCards = [
      CustomCard(
        sectionName: 'القسم 1',
        sectionStatus: 'الحالة 1',
      ),
      CustomCard(
        sectionName: 'القسم 2',
        sectionStatus: 'الحالة 2',
      ),
      CustomCard(
        sectionName: 'القسم 3',
        sectionStatus: 'الحالة 3',
      ),
      CustomCard(
        sectionName: 'القسم 4',
        sectionStatus: 'الحالة 4',
      ),
      CustomCard(
        sectionName: 'القسم 4',
        sectionStatus: 'الحالة 4',
      ),
    ];

    cards.value = fetchedCards;
  }

  // Simulate fetching dropdowns from an API or database
  void fetchDropdowns() {
    // Replace this with your actual API or database call
    final List<CustomDropdown> fetchedDropdowns = [
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


    dropdowns.value = fetchedDropdowns;
  }
}