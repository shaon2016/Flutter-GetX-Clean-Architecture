
import 'package:get/get.dart' as g;
import 'package:dio/dio.dart' ;

// const BASE_URL = "put_your_base_url_here";
const BASE_URL = "https://hris.sslwireless.com/api/v1/";

class RestClient extends g.GetxService {
  late Dio _dio;

  Future<RestClient> init() async {
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
      print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  Future<Response>? getRequest(String url, Map<String, dynamic> params) async {
    Response? response;
    try {
      response = await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e);
    }

    return response;
  }

  Future<Response>? postRequest(String url, Map<String, dynamic> params) async {
    Response? response;
    try {
      response = await _dio.post(url, data: params);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e);
    }

    return response;
  }


}
