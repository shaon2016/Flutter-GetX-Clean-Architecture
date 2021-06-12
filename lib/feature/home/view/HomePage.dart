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
        body: Obx(() => controller.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(controller.datas[index].bloodGroup),
                  );
                },
                itemCount: controller.datas.length,
              )));
  }
}
