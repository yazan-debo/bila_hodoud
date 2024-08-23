import 'dart:convert';

import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../../../core/utils/app_shared_pref.dart';
import '../model/coupon_model.dart';
import '../model/coupons_model.dart';

class CouponsController extends GetxController
    with StateMixin<List<CouponsModel>> {
  Future<void> getCoupons(bool withRefresh) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        if (withRefresh) {
          change(null, status: RxStatus.loading());
        }
      });

      const url = '${Urls.baseUrl}${Urls.coupon}/all';

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
        print("1");
        List<CouponsModel> coupons = [];
        print("2");

        coupons = (data[0] as List<dynamic>)
            .map((i) => CouponsModel.fromJson(i))
            .toList();
        print("3");

        if (coupons.isNotEmpty) {
          change(coupons, status: RxStatus.success());
          print("I'm in: ${coupons}");
        } else {
          change(coupons, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
