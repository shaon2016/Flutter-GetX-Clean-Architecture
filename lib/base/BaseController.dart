import 'package:clean_architecture/core/network/rest_client_impl.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RestClientImpl restClient;
  final isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    restClient = Get.find();
  }

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }
}
