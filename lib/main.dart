import 'package:bila_hodoud/features/libraries/view/pages/libraries_screen.dart';
import 'package:bila_hodoud/features/offers/view/pages/offers_screen.dart';
import 'package:bila_hodoud/features/orders/view/pages/cancelled_orders_screen.dart';
import 'package:bila_hodoud/features/orders/view/pages/done_orders_screen.dart';
import 'package:bila_hodoud/features/orders/view/pages/delivery_orders_screen.dart';
import 'package:bila_hodoud/features/sections/view/pages/modify_section_screen.dart';
import 'package:bila_hodoud/presentation/view/home_screen.dart';
import 'package:bila_hodoud/features/authentication/view/pages/login_screen.dart';

import 'package:bila_hodoud/features/sections/view/pages/section_details_screen.dart';
import 'package:bila_hodoud/presentation/view/settings_screen.dart';
import 'package:bila_hodoud/presentation/view/splash_screen.dart';
import 'package:bila_hodoud/features/permissions/view/pages/sys_roles_interface.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/constants/style/color_style_features.dart';
import 'core/constants/style/text_style_features.dart';
import 'core/services/settings_services.dart';
import 'core/utils/data_bindings.dart';
import 'features/orders/view/pages/pending_order_details_screen.dart';
import 'features/orders/view/pages/pending_orders_screen.dart';
import 'features/sections/view/pages/all_sections_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingsServices().init());
}

class MyApp extends StatelessWidget {
  TextStyleFeatures textStyleFeatures = TextStyleFeatures();

  @override
  Widget build(BuildContext context) {
    final double availableWidth = MediaQuery.of(context).size.width;
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bila Houdoud',
        initialRoute: '/',
        textDirection: TextDirection.rtl,
        initialBinding: DataBindings(),
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/settings', page: () => SettingsScreen()),
          GetPage(name: '/login', page: () => LoginScreen()),
          GetPage(
              name: '/section-details',
              page: () => const SectionDetailsScreen()),
          GetPage(name: '/all-sections', page: () => const AllSectionsScreen()),
          GetPage(name: '/sys_roles', page: () => const SysRolesInterface()),
          GetPage(name: '/modifySection', page: () => ModifySectionScreen()),
          GetPage(
              name: '/pending-orders', page: () => const PendingOrdersScreen()),
          GetPage(
              name: '/pending_orders_details',
              page: () => const PendingOrderDetailsScreen()),
          GetPage(
              name: '/libraries_screen', page: () => const LibrariesScreen()),
          GetPage(name: '/offers_screen', page: () => const OffersScreen()),
          GetPage(
              name: '/delivery_orders',
              page: () => const DeliveryOrdersScreen()),
          GetPage(
              name: '/cancelled_orders',
              page: () => const CancelledOrdersScreen()),
          GetPage(name: '/done_orders', page: () => const DoneOrdersScreen()),
        ],
        theme: ThemeData(
          cardColor: ColorStyleFeatures.cardColor,
          // Apply the card color from style features
          textTheme: TextTheme(
            titleLarge:
                textStyleFeatures.cardTitleTextStyle(availableWidth, true),
            titleMedium:
                textStyleFeatures.cardTitleTextStyle(availableWidth, false),
          ),
        ),
      );
    });
  }
}
