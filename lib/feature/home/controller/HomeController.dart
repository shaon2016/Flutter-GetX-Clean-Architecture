import 'package:clean_architecture/base/BaseController.dart';
import 'package:clean_architecture/core/network/rest_client.dart';
import 'package:clean_architecture/feature/home/model/BloodFinder.dart';
import 'package:dio/dio.dart' as d;
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

    try {
      final result = await restClient.request("blood-finder", Method.GET, map);

      if (result != null) {
        if (result is d.Response) {
          var data = BloodDonor.fromJson(result.data).data;
          if (data != null) {
            donors.addAll(data.data);
            isToLoadMore = true;
            change(donors, status: RxStatus.success());
          } else {
            isToLoadMore = false;
          }
        }
      } else {
        isToLoadMore = false;
      }
    } on Exception catch (e) {
      Get.showSnackbar(GetBar(
        message: "$e",
        duration: Duration(milliseconds: 3000),
      ));
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
