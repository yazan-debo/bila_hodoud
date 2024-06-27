import "package:bila_hodoud/features/libraries/controller/libraries_controller.dart";
import "package:bila_hodoud/features/subsections/controller/subsection_controller.dart";
import "package:get/get.dart";

import "../../features/authentication/controller/login_controller.dart";
import "../../features/sections/controller/all_sections_controller.dart";

class DataBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => AllSectionsController(), fenix: true);
    Get.lazyPut(() => LibrariesController(), fenix: true);
    Get.lazyPut(() => SubsectionsController(), fenix: true);
  }
}
