import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../model/models/product_model.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductModel>> {
  Future<void> getAllProducts(int sectionId) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        change(null, status: RxStatus.loading());
      });

      String url = '${Urls.baseUrl}${Urls.products}/$sectionId';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List<ProductModel> sections = [];

        sections = (data['data'] as List<dynamic>)
            .map((i) => ProductModel.fromJson(i))
            .toList();
        if (sections.isNotEmpty) {
          change(sections, status: RxStatus.success());
        } else {
          change(sections, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

// Future<bool> addProduct(dynamic params) async {
//   try {
//     DialogHelper.showLoadingDialog();
//     const url = '${Urls.baseUrl}${Urls.section}';
//
//     var headers = {
//       'Content-Type': 'application/json',
//       // Add any additional headers here
//     };
//
//     var body = jsonEncode(params.toJson());
//
//     var response =
//         await http.post(Uri.parse(url), headers: headers, body: body);
//
//     if (response.statusCode == 201) {
//       Get.back();
//       DialogHelper.showSuccessDialog();
//       Get.offNamed("/all-sections");
//     } else {
//       Get.back();
//       DialogHelper.showErrorDialog(
//           title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
//     }
//   } catch (e) {
//     Get.back();
//     DialogHelper.showErrorDialog(title: "خطأ", description: e.toString());
//   }
// }
//
// Future<void> updateSection(int sectionId, SectionParams params) async {
//   try {
//     DialogHelper.showLoadingDialog();
//     String url = '${Urls.baseUrl}${Urls.section}/$sectionId';
//
//     var headers = {
//       'Content-Type': 'application/json',
//       // Add any additional headers here
//     };
//
//     var body = jsonEncode(params.toJson());
//
//     var response =
//         await http.put(Uri.parse(url), headers: headers, body: body);
//
//     if (response.statusCode == 201) {
//       Get.back();
//       DialogHelper.showSuccessDialog();
//       Get.offNamed("/all-sections");
//     } else {
//       Get.back();
//       DialogHelper.showErrorDialog(
//           title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
//     }
//   } catch (e) {
//     Get.back();
//     DialogHelper.showErrorDialog(title: "خطأ", description: e.toString());
//   }
// }
}