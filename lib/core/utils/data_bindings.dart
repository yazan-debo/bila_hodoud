import "package:bila_hodoud/features/libraries/controller/libraries_controller.dart";
import "package:bila_hodoud/features/offers/controller/offers_controller.dart";
import "package:bila_hodoud/features/orders/controller/normal_orders_controller.dart";
import "package:bila_hodoud/features/orders/model/models/normal_order_model.dart";
import "package:bila_hodoud/features/permissions/controller/roles_controller.dart";
import "package:bila_hodoud/features/products/controller/products_controller.dart";
import "package:bila_hodoud/features/subsections/controller/subsection_controller.dart";
import "package:get/get.dart";

import "../../features/authentication/controller/login_controller.dart";
import "../../features/orders/controller/status_dropdown_controller.dart";
import "../../features/sections/controller/all_sections_controller.dart";
import "../../features/subsections/controller/dropdown_controller.dart";

class DataBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => AllSectionsController(), fenix: true);
    Get.lazyPut(() => LibrariesController(), fenix: true);
    Get.lazyPut(() => SubsectionsController(), fenix: true);
    Get.lazyPut(() => ProductsController(), fenix: true);
    Get.lazyPut(() => RolesController(), fenix: true);
    Get.lazyPut(() => OffersController(), fenix: true);
    Get.lazyPut(() => DropdownController(), fenix: true);
    Get.lazyPut(() => StatusDropdownController(), fenix: true);
    Get.lazyPut(() => NormalOrdersController(), fenix: true);
  }
}
