import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

import '../../../core/constants/urls.dart';
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
