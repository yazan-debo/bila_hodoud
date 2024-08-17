import 'dart:convert';

import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';

import '../../products/model/models/image_file_model.dart';

class ReportsController extends GetxController with StateMixin<String> {
  Future<void> getReport() async {
    DialogHelper.showLoadingDialog();

    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {});

      const url = '${Urls.baseUrl}${Urls.report}';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.back();
        DialogHelper.showSuccessDialog();
        var data = jsonDecode(response.body);
        print(data);
      } else {
        Get.back();
        DialogHelper.showErrorDialog(
            title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorDialog(
          title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
    }
  }
}
