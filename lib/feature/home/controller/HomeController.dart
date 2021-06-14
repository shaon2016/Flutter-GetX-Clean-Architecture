import 'package:clean_architecture/base/BaseController.dart';
import 'package:clean_architecture/feature/home/model/BloodFinder.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends BaseController with StateMixin, ScrollMixin {
  final donors = <BloodDonors>[].obs;
  var page = 1;
  var isToLoadMore = true;

  @override
  onInit() {
    super.onInit();

    loadData();
  }

  loadData() async {
    final map = Map<String, dynamic>();
    map['page'] = page;

    final result = await restClient.getRequest("blood-finder", map);

    if (result != null) {
      var data = BloodDonor.fromJson(result.data).data;
      if (data != null) {
        donors.addAll(data.data);
        isToLoadMore = true;
        change(donors, status: RxStatus.success());
      } else {
        isToLoadMore = false;
      }
    } else {
      isToLoadMore = false;
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (isToLoadMore) {
      page++;
      await loadData();
    }
    print("onEngScroll: Called");
  }

  @override
  Future<void> onTopScroll() async {
    print("onTopScroll: Called");
  }
}
