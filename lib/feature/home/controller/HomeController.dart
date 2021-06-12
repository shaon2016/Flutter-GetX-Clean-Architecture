import 'package:clean_architecture/base/BaseController.dart';
import 'package:clean_architecture/feature/home/model/BloodFinderResources.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends BaseController {

  final datas = <BloodGroups>[].obs;

  @override
  onInit() {
    super.onInit();

    loadData();
  }

  loadData() async {
    showLoading();

    final map = Map<String, dynamic>();

    final result = await restClient.getRequest("blood-finder-resources", map);

    if (result != null) {
      datas.value = BloodFinderResources.fromJson(result.data).data.bloodGroups;
    }

    hideLoading();
  }
}
