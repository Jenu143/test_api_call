import 'package:api_call/model/api_model.dart';

class CustomModal<T> {
  int? statusCode;
  T? data;

  CustomModal({
    this.statusCode,
    this.data,
  });
}
