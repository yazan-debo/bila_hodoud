import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../../sections/view/pages/section_details_screen.dart';
import '../model/models/product_model.dart';
import '../model/params/product_params.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductModel>> {
  Future<void> getProducts(int sectionId, bool withRefresh) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        if (withRefresh) {
          change(null, status: RxStatus.loading());
        }
      });

      String url = '${Urls.baseUrl}${Urls.section}/${Urls.products}/$sectionId';

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

        List<ProductModel> products = [];

        products = (data['section']['products'] as List<dynamic>)
            .map((i) => ProductModel.fromJson(i))
            .toList();
        if (products.isNotEmpty) {
          change(products, status: RxStatus.success());
        } else {
          change(products, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> addProduct(ProductParams params) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.products}';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      Map<String, String> body = params.toJson();
      print(params.toJson());

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(
            headers) //if u have headers, basic auth, token bearer... Else remove line
        ..fields.addAll(body);
      var response = await request.send();

      if (response.statusCode == 201) {
        Get.back();
        DialogHelper.showSuccessDialog();
        Get.off(() => SectionDetailsScreen(
              initialPage: 0,
              sectionId: int.parse(params.sectionId!),
            ));
      } else {
        Get.back();
        DialogHelper.showErrorDialog(
            title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorDialog(title: "خطأ", description: e.toString());
    }
  }
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
