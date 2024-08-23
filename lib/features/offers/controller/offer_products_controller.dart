import 'package:bila_hodoud/features/offers/model/params/offer_product_params.dart';
import 'package:bila_hodoud/features/permissions/model/models/role_model.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';

import 'package:http/http.dart' as http;

class OfferProductsController extends GetxController {
  RxList offerProducts = [].obs;

  void addOfferProducts(OfferProductParams offerProduct) {
    offerProducts.add(offerProduct);
  }

  void clear() {
    offerProducts = [].obs;
  }
}
