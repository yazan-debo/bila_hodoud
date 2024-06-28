import 'dart:convert';

import 'package:bila_hodoud/features/offers/model/params/offer_params.dart';
import 'package:bila_hodoud/features/permissions/model/params/role_params.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../model/models/offer_model.dart';

class OffersController extends GetxController
    with StateMixin<List<OfferModel>> {
  Future<void> getOffers(bool withRefresh) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        if (withRefresh) {
          change(null, status: RxStatus.loading());
        }
      });

      const url = '${Urls.baseUrl}${Urls.offer}/index';

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

        List<OfferModel> offers = [];
        offers = (data['data'] as List<dynamic>)
            .map((i) => OfferModel.fromJson(i))
            .toList();
        if (offers.isNotEmpty) {
          change(offers, status: RxStatus.success());
        } else {
          change(offers, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> addOffer(OfferParams params) async {
    try {
      DialogHelper.showLoadingDialog();
      const url = '${Urls.baseUrl}${Urls.offer}/store';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      var body = jsonEncode(params.toJson());

      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 201) {
        Get.back();
        DialogHelper.showSuccessDialog();
        Get.offNamed("/sys_roles");
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

  Future<void> updateOffer(int offerId, OfferParams params) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.offer}/update/$offerId';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      var body = jsonEncode(params.toJson());

      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 201) {
        Get.back();
        DialogHelper.showSuccessDialog();
        Get.offNamed("/offer_screen");
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

  Future<bool> deleteOffer(
    int offerId,
  ) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.offer}/delete/$offerId';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      var response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 204) {
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

  Future<void> searchOffer(String keyword) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        // if (withRefresh) {
        //   change(null, status: RxStatus.loading());
        // }
      });

      String url = '${Urls.baseUrl}${Urls.offer}/search/$keyword';

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

        List<OfferModel> offers = [];
        offers =
            (data as List<dynamic>).map((i) => OfferModel.fromJson(i)).toList();
        if (offers.isNotEmpty) {
          change(offers, status: RxStatus.success());
        } else {
          change(offers, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
