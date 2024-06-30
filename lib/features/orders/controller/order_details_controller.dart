import 'dart:convert';

import 'package:bila_hodoud/core/utils/app_shared_pref.dart';
import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/orders/model/models/normal_order_model.dart';
import 'package:bila_hodoud/features/orders/model/params/change_status_params.dart';
import 'package:bila_hodoud/features/orders/model/params/processing_order_params.dart';
import 'package:bila_hodoud/features/orders/view/pages/pending_orders_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../model/models/order_details_model.dart';

class OrderDetailsController extends GetxController
    with StateMixin<OrderDetailsModel> {
  Future<void> getOrderDetails(int orderId) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        change(null, status: RxStatus.loading());
      });

      String url = '${Urls.baseUrl}dashboard/${Urls.orders}/$orderId';

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

        OrderDetailsModel order = OrderDetailsModel.fromJson(data);

        change(order, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
