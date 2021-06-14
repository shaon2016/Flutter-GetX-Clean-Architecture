import 'package:clean_architecture/feature/home/controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  static final routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clean Architecture"),
        ),
        body: controller.obx((state) => ListView.builder(
          controller: controller.scroll,
          itemBuilder: (ctx, index) {
                if (controller.isToLoadMore &&
                    controller.donors.length - 1 == index)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return ListTile(
                  title: Text(controller.donors[index].name),
                  subtitle: Text(controller.donors[index].designation),
                );

              },
              itemCount: controller.donors.length,
            )));
  }
}
