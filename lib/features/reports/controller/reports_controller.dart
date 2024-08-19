import 'dart:convert';

import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import 'dart:typed_data';

import '../../../core/utils/app_shared_pref.dart';
import '../../products/model/models/image_file_model.dart';

class ReportsController extends GetxController with StateMixin<Uint8List?> {
  Future<void> getReport() async {
    DialogHelper.showLoadingDialog();

    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {});

      const url = '${Urls.baseUrl}${Urls.report}';
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
        Get.back();
        DialogHelper.showSuccessDialog();
        Uint8List pdfData = response.bodyBytes;
        change(pdfData, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
    }
  }

  void downloadFile(String url, String filename) {
    // Create an anchor element
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click(); // Programmatically click the anchor
  }
}
