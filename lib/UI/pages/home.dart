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
          //this widget Obx is a observable of GetX and works with .obs variable like 'cartController.myCartList' to update only what is inside of it
          Obx(
            ()=> IconButton(
              key: const Key("btnNavigateToMyCart"),
                onPressed: () {
                  Navigator.pushNamed(
                      context, DeliveryRouteName.cart);
                },
                icon: Stack(
                  fit: StackFit.expand,
              children: [
                Icon(cartController.myCartList.isEmpty?Icons.shopping_cart_outlined: Icons.add_shopping_cart_rounded),
                 cartController.myCartList.isEmpty?const SizedBox(): Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(radius: 7, backgroundColor: Colors.redAccent.shade200,),)
              ],
            )),
          )
        ],
      ),
      body: Obx(() {
        return cartController.productList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text("\nLoading products...")
                  ],
                ),
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
                                          duration: const Duration(seconds: 1),
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
