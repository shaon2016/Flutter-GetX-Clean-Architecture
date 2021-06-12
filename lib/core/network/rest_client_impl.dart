import 'package:clean_architecture/core/network/rest_client.dart';
import 'package:dio/dio.dart';

const BASE_URL = "put_your_base_url_here";

class RestClientImpl extends RestClient {
  Dio _dio;

  Future<RestClientImpl> init() async {
    _dio = Dio(BaseOptions(baseUrl: BASE_URL));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print(
          'REQUEST[${options.method}] => PATH: ${options.path} => Request Values: ${options.queryParameters}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('RESPONSE[${response.statusCode}]');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  @override
  Future getRequest(String url, Map<String, dynamic> params) async {
    Response response;
    try {
      response = await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e);
    }

    return response;
  }

  @override
  Future postRequest(String url, Map<String, dynamic> params) async {
    Response response;
    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e);
    }

    return response;
  }
}
