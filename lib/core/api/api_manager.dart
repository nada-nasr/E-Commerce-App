import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(validateStatus: (status) => true),
    );
  }
}
