import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:typed_data';

class SelectedItemDropdownController extends GetxController {
  Rx<String> selectedItem = " ".obs;

  void change(String newValue) {
    selectedItem.value = newValue;
    print(selectedItem.value);
  }
}
