import 'package:get/get.dart';

abstract class RestClient extends GetxService {
  Future getRequest(String url, Map<String, dynamic> params);
  Future postRequest(String url, Map<String, dynamic> params);
}