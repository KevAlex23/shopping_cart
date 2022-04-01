import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/UI/pages/home.dart';
import 'package:kev_commerce/UI/routes/navigation_routes.dart';
import 'package:kev_commerce/controllers/main_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //insert global controller
    // Get.put(CartController());
    return GetMaterialApp(
      title: 'Kev Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: DeliveryRouteName.home,
      getPages: DeliveryPage.pages,
      initialBinding: MainBinding(),
    );
  }
}
