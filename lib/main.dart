import 'package:clean_architecture/core/database/database.dart';
import 'package:clean_architecture/core/network/rest_client.dart';
import 'package:clean_architecture/feature/home/binding.dart';
import 'package:clean_architecture/feature/home/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(MyApp());
}

initServices() async {
  await Get.putAsync<RestClient>(() => RestClient().init());
  await Get.putAsync<AppDb>(() => AppDb.init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Clean Architecture Demo',
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(
          name: HomePage.routeName,
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
      ],
    );
  }


}
