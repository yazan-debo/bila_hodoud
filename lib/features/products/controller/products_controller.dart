import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bila_hodoud/features/products/model/models/image_file_model.dart';
import 'package:flutter/foundation.dart';
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

  Future<bool> addProduct(
      ProductParams params, List<ImageFileModel> images) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.products}';

      var headers = {
        'Content-Type': 'multipart/form-data',
        // Add any additional headers here
      };

      Map<String, dynamic> body = params.toJson();
      var multipartRequest = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers);

      var request = jsonToFormData(multipartRequest, body);

      for (int i = 0; i <= images.length - 1; i++) {
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
            'images[]', images[i].image!.cast(),
            filename: images[i].fileName);
        request.files.add(multipartFile);
      }

      print(request.fields);
      var response = await request.send();

      if (response.statusCode == 201) {
        Get.back();
        DialogHelper.showSuccessDialog();
        Get.off(() => SectionDetailsScreen(
              initialPage: 0,
              sectionId: int.parse(params.sectionId!),
            ));
        return true;
      } else {
        var response1 = await http.Response.fromStream(response);
        final result = jsonDecode(response1.body) as Map<String, dynamic>;
        debugPrint(result['message']);
        debugPrint(result['error']);
        Get.back();
        DialogHelper.showErrorDialog(
            title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
        return false;
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorDialog(title: "خطأ", description: e.toString());
      return false;
    }
  }

  Future<void> updateProduct(int sectionId, int productId, ProductParams params,
      List<ImageFileModel> images) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.products}/update/$productId';

      var headers = {
        'Content-Type': 'multipart/form-data',
        // Add any additional headers here
      };

      Map<String, dynamic> body = params.toJson();
      var multipartRequest = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll(headers);

      var request = jsonToFormData(multipartRequest, body);

      for (int i = 0; i <= images.length - 1; i++) {
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
            'images[]', images[i].image!.cast(),
            filename: images[i].fileName);
        request.files.add(multipartFile);
      }

      print(request.fields);
      print(request.url);
      var response = await request.send();

      if (response.statusCode == 200) {
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

  Future<bool> deleteProduct(int productId) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.products}/delete/$productId';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      var response = await http.delete(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        Get.back();
        DialogHelper.showSuccessDialog();
        return true;
      } else {
        Get.back();
        DialogHelper.showErrorDialog(
            title: "خطأ", description: "حدث خطأ ما يرجى إعادة المحاولة");
        return false;
      }
    } catch (e) {
      Get.back();
      DialogHelper.showErrorDialog(title: "خطأ", description: e.toString());
      return false;
    }
  }
}

jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
  for (var key in data.keys) {
    if (key == "book" ||
        key == "game" ||
        key == "stationery" ||
        key == "quran") {
      var bookData = Map<String, dynamic>.from(data[key]);
      for (var key1 in bookData.keys) {
        request.fields[key1] = bookData[key1].toString();
      }
    } else {
      request.fields[key] = data[key].toString();
    }
  }
  return request;
}
