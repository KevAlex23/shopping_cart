import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/UI/widget/product_card.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';

//GetWidget works as controller of this view, getX letme use StalessWidget and handling the state by 'CartController' 
class CartView extends GetWidget<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
        title: const Text("My cart"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox()),
            Expanded(
              flex: 4,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Stack(
                          children: [
                            ProductCard(
                              product: controller.productList[index],
                              actions: Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove_circle_outline),
                                            splashRadius: 20,
                                          ),
                                          Text("${0}"),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add_circle_outline_sharp),
                                            splashRadius: 20,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Card(
                  shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                  margin: const EdgeInsets.all(0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Sub total", style: subTitleTextStyle,),
                                  Text("sub Total", style: subTitleTextStyle,),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery", style: subTitleTextStyle,),
                                  Text("delivery Total", style: subTitleTextStyle,),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total", style: titleTextStyle,),
                                Text("\$ 0.0", style: titleTextStyle,),
                              ],
                            ),
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Chekout"),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
