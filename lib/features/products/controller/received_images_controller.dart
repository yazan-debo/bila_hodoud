import 'package:get/get.dart';
import 'dart:convert';

class ReceivedImagesController extends GetxController {
  RxList<String> imagePaths = <String>[].obs;

  void parseImages(String imagesJson) {
    try {
      List<dynamic> imagesList = jsonDecode(imagesJson);
      imagePaths.value = imagesList.map((image) => image.toString()).toList();
    } catch (e) {
      print('Error parsing images: $e');
      imagePaths.value = [];
    }
  }
}
