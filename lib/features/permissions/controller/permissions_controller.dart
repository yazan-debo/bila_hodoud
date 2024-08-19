import 'dart:convert';

import 'package:bila_hodoud/features/permissions/model/params/permission_params.dart';
import 'package:bila_hodoud/features/permissions/model/params/role_params.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../../../core/utils/app_shared_pref.dart';
import '../model/models/role_model.dart';

class PermissionsController extends GetxController
    with StateMixin<List<PermessionModel>> {
  Future<void> getAllPermissions(bool withRefresh) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        if (withRefresh) {
          change(null, status: RxStatus.loading());
        }
      });

      const url = '${Urls.baseUrl}permission/index';

      AppSharedPref appSharedPref = AppSharedPref();
      String token = appSharedPref.getToken();
      var headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
        // Add any additional headers here
      };
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List<PermessionModel> permissions = [];
        permissions = (data as List<dynamic>)
            .map((i) => PermessionModel.fromJson(i))
            .toList();
        if (permissions.isNotEmpty) {
          change(permissions, status: RxStatus.success());
        } else {
          change(permissions, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
