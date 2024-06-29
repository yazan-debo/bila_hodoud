import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:typed_data';

import '../model/models/image_file_model.dart';

class FileUploadController extends GetxController {
  RxList images = [].obs;

  void addFile(Uint8List file, String fileName) {
    ImageFileModel model = ImageFileModel(fileName, file);
    images.add(model);
  }

  void clear() {
    images.clear();
  }
}
