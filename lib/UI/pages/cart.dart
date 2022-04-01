import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/UI/widget/product_card.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';

class CartView extends GetWidget<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.35,
          child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                        child: Column(
                          children: [
                            ProductCard(product: controller.productList[index]),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
        ),
        Container(
          height: 100,
        )
      ],
    ));
  }
}
