import 'dart:collection';

import 'package:clean_architecture/base/BaseController.dart';

class HomeController extends BaseController {

  loadData() async {
    showLoading();

    final map = Map<String, dynamic>();
    map['name'] = "Ashiq";

    final result = await restClient.getRequest("", map);

    if(result != null) {

    }

    hideLoading();
  }
}