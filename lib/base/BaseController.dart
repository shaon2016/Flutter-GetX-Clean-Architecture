import 'package:clean_architecture/core/network/rest_client.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  late RestClient restClient;

  @override
  onInit() {
    super.onInit();
    restClient = Get.find();
  }


}
