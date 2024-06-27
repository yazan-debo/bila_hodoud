import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../../../core/utils/app_shared_pref.dart';
import '../model/models/user_model.dart';
import '../model/params/login_params.dart';

class LoginController extends GetxController with StateMixin<bool> {
  late AppSharedPref appSharedPref;

  @override
  void onInit() {
    appSharedPref = AppSharedPref();
    super.onInit();
  }

  Future<void> loginApi(LoginParams params) async {
    change(false, status: RxStatus.loading());
    DialogHelper.showLoadingDialog();
    const url = '${Urls.baseUrl}${Urls.login}';

    var headers = {
      'Content-Type': 'application/json',
      // Add any additional headers here
    };

    var body = jsonEncode(params.toJson());
    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body));
        appSharedPref.saveToken(user);
        Get.back();
        Get.offAllNamed("/all-sections");
        change(true, status: RxStatus.success());
      } else {
        Get.back();
        DialogHelper.showErrorDialog(
            title: "خطأ",
            description: "اسم المستخدم أو كلمة المررور غير صحيحة");
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorDialog(title: "خطأ", description: e.toString());
    }
  }
}
