import 'dart:convert';

import 'package:api_call/constant/strings.dart';
import 'package:api_call/model/api_model.dart';
import 'package:api_call/model/custom_model.dart';
import 'package:http/http.dart' as http;

class GetApi {
  Future<CustomModal<List<BeersListClass>>> getApi() async {
    final response = await http.get(Uri.parse(Strings.url));

    if (response.statusCode == 200) {
      return CustomModal(data: breweryModelFromJson(response.body));
    } else {
      return CustomModal(statusCode: 400);
    }
  }
}
