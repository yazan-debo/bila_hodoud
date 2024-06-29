import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:typed_data';

class StatusDropdownController extends GetxController {
  Rx<String> selectedItem = "في طريقه إليك".obs;

  void change(String newValue) {
    selectedItem.value = newValue;
  }
}
