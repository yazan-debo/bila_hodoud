import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../domain/entities/section.dart';
import '../../../domain/repositories/section_repository.dart';
import '../../models/section_model.dart';
import 'api_config.dart';

class SectionApi {
  Future<void> createSection(SectionModel sectionModel) async{
    const url = '${ApiConfig.baseUrl}section';

    var headers = {
      'Content-Type': 'application/json',
      // Add any additional headers here
    };

    var body = json.encode(sectionModel.toJson());

    var response = await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      // Request successful, handle the response
      if (kDebugMode) {
        print('Response: ${response.body}');
      }
    } else {
      // Request failed, handle the error
      if (kDebugMode) {
        print('Error: ${response.statusCode}');
      }
    }
  }
  Future<void> editSection(SectionModel sectionModel , int id) async {

    final url = '${ApiConfig.baseUrl}section/$id';

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    var body = json.encode(sectionModel.toJson1());

    final response = await http.put(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print('Section updated successfully');
      }
    } else {
      if (kDebugMode) {
        print('Failed to update section. Status code: ${response.statusCode}');
      }
    }
  }
}

