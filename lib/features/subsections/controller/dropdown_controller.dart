import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:typed_data';

class DropdownController extends GetxController {
  Rx<int> selectedItem = 1.obs;

  void change(int newValue) {
    selectedItem.value = newValue;
  }
}
