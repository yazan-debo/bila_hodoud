import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:typed_data';

class DeliveryMethodDropdownController extends GetxController {
  Rx<String> selectedItem = "شحن الى محافظة أخرى".obs;

  void change(String newValue) {
    selectedItem.value = newValue;
  }
}
