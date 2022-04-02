import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:kev_commerce/UI/routes/navigation_routes.dart';
import 'package:kev_commerce/UI/widget/product_card.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController =
        Get.put<CartController>(CartController(apiRepository: Get.find()));
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
        title: Text(
          "Kev Commerce",
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, DeliveryRouteName.cart, arguments: <String,int>{"proof":2});
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Obx(() {
        return cartController.productList.isEmpty
            ? const Center(
                child: Text("Empty"),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartController.productList.length,
                itemBuilder: (context, index) {
                  int count = 0;
                  return ProductCard(
                      product: cartController.productList[index],
                      actions: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add to cart",
                                style: buttonTextStyle,
                              )
                            ],
                          ),
                          onPressed: () {}));
                });
      }),
    );
  }
}
