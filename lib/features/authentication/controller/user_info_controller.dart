import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:typed_data';
class UserInfoController extends GetxController {
 static Rx<String?> uName = "".obs;


  void setUserName(String? userName) {
    print("userName: $userName");
    uName.value = userName;
    print("uName.value: ${uName.value}");
  }

}
