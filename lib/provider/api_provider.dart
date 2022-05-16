import 'package:api_call/api/get_api.dart';
import 'package:api_call/model/api_model.dart';
import 'package:api_call/model/custom_model.dart';
import 'package:flutter/material.dart';

class GetApiProvider extends ChangeNotifier {
  GetApi getApi = GetApi();
  CustomModal<List<BeersListClass>> customModal =
      CustomModal<List<BeersListClass>>();

  Future<CustomModal<List<BeersListClass>>> getApiProvider() async {
    customModal = await getApi.getApi();
    notifyListeners();
    return customModal;
  }
}
