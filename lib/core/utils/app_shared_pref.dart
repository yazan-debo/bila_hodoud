import 'package:get/get.dart';

import '../../features/authentication/model/models/user_model.dart';
import '../services/settings_services.dart';

class AppSharedPref {
  SettingsServices controller = Get.find();

  void saveToken(UserModel user) {
    controller.sharedPref.setString("token", user.token ?? "");
  }

  bool isLogin() {
    return (controller.sharedPref.getString("token") ?? "").isNotEmpty;
  }

  void deleteAll() {
    controller.sharedPref.clear();
  }
}
