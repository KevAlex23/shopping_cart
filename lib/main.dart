import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:kev_commerce/UI/routes/navigation_routes.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/main_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kev Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: Colors.white),
            ),
          ),)
      ),
      //this the initial page HomeView()
      initialRoute: DeliveryRouteName.home,
      getPages: DeliveryPage.pages,
      initialBinding: MainBinding(),
    );
  }
}
