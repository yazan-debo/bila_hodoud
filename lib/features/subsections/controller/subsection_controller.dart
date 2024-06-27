import 'dart:convert';

import 'package:bila_hodoud/features/libraries/model/models/library_model.dart';
import 'package:bila_hodoud/features/sections/model/models/section_model.dart';
import 'package:bila_hodoud/features/sections/view/pages/section_details_screen.dart';
import 'package:bila_hodoud/features/subsections/model/models/subsection_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';
import '../model/params/subsection_params.dart';

class SubsectionsController extends GetxController
    with StateMixin<List<SubsectionModel>> {
  Future<void> getSubsections(int sectionId, bool withRefresh) async {
    try {
      await Future.delayed(Duration(milliseconds: 500)).then((g) {
        if (withRefresh) {
          change(null, status: RxStatus.loading());
        }
      });

      const url = '${Urls.baseUrl}${Urls.sectionSubsection}';

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

        List<SubsectionModel> subsections = [];
        subsections = (data['data'] as List<dynamic>)
            .map((i) => SubsectionModel.fromJson(i))
            .toList();
        if (subsections.isNotEmpty) {
          change(subsections, status: RxStatus.success());
        } else {
          change(subsections, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.error("حدث خطأ في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> addSubsection(int sectionId, SubsectionParams params) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.subsection}/$sectionId';

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
        Get.off(() => SectionDetailsScreen(
              initialPage: 1,
              sectionId: sectionId,
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

  Future<void> updateSubsection(
      int subsectionId, SubsectionParams params) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.subsection}/$subsectionId';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      var body = jsonEncode(params.toJson());

      var response =
          await http.put(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        Get.back();
        DialogHelper.showSuccessDialog();
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

  Future<bool> deleteSubsection(
    int subsectionId,
  ) async {
    try {
      DialogHelper.showLoadingDialog();
      String url = '${Urls.baseUrl}${Urls.subsection}/$subsectionId';

      var headers = {
        'Content-Type': 'application/json',
        // Add any additional headers here
      };

      var response = await http.delete(Uri.parse(url), headers: headers);

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
}
