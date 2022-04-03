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
        Get.put<CartController>(CartController(Get.find(), Get.find()));
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
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
                    context, DeliveryRouteName.cart);
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Obx(() {
        return cartController.productList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartController.productList.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    controller: cartController,
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
                          onPressed: () {
                            cartController.addProductToMyCart(cartController.productList[index]).then(
                                  (value) => value != "done"
                                      ? Get.snackbar("Add error", value, icon: const Icon(
                                              Icons
                                                  .warning_rounded,
                                              color: Colors.amber),
                                          borderWidth: 2,
                                          borderColor: Colors.amber,
                                          backgroundColor:
                                              cardBackgroundColor)
                                      : Get.snackbar("Add to cart",
                                          "The product ${cartController.productList[index].title} was successfully added!",
                                          icon: Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: primaryColor),
                                          borderWidth: 2,
                                          borderColor: primaryColor,
                                          backgroundColor:
                                              cardBackgroundColor));;
                          }));
                });
      }),
    );
  }
}
