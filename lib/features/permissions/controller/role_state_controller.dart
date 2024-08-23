import 'package:bila_hodoud/features/permissions/model/models/role_model.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import '../../../core/constants/urls.dart';
import '../../../core/helper/dialog_helper.dart';

import 'package:http/http.dart' as http;

import '../model/params/permission_params.dart';

class RoleStateController extends GetxController {
  RxList permissions = [].obs;

  void addPermission(PermissionParams permission) {
    permissions.add(permission);
  }
}
