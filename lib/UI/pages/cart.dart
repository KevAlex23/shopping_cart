import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kev_commerce/UI/widget/custom_alert_dialog.dart';
import 'package:kev_commerce/UI/widget/product_card.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';

//GetWidget works as controller of this view, getX letme use StalessWidget and handling the state by 'CartController'
class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height <
                MediaQuery.of(context).size.width
            ? MediaQuery.of(context).size.height * 0.1
            : kToolbarHeight,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
        title: Text(
          "My cart",
          key: const ValueKey("My Cart View"),
          style: appBarTextStyle,
        ),
        actions: [
          Obx(
            () => IconButton(
                color: Colors.redAccent.shade200,
                onPressed: controller.myCartList.isEmpty
                    ? null
                    : () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CustomAlertDialog(
                                  title: "your products",
                                  count: "all",
                                  onDelete: () {
                                    controller.deleteAllProductsMyCart();
                                  });
                            });
                      },
                icon: const Icon(Icons.delete_sweep_outlined)),
          )
        ],
      ),
      body: SafeArea(child: Obx(() {
        Column loadingWidget = Column(
          children: [
            const CircularProgressIndicator(),
            const Text("\nLoading cart's products"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        );
        Column widgetLoaded = Column(
          children: [
            const Icon(
              Icons.add_shopping_cart_rounded,
              size: 48.0,
            ),
            Text(
              "Your cart is empty",
              style: titleTextStyle,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go home"),
            ),
          ],
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery.of(context).size.height <
                    MediaQuery.of(context).size.width
                ? const SizedBox()
                : controller.myCartList.isNotEmpty
                    ? const Expanded(flex: 1, child: SizedBox())
                    : const SizedBox(height: 10),
            controller.myCartList.isEmpty
                ? StatefulBuilder(builder: (context, setState) {
                    if (loadingWidget != widgetLoaded) {
                      Future.delayed(const Duration(seconds: 10))
                          .whenComplete(() {
                        loadingWidget = widgetLoaded;
                        setState(() {});
                      });
                    }
                    return Center(
                        child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      transitionBuilder: (child, Animation<double> animation) {
                        return ScaleTransition(child: child, scale: animation);
                      },
                      child: loadingWidget,
                    ));
                  })
                : Expanded(
                    flex: 4,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.myCartList.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                              width: MediaQuery.of(context).size.height <
                                      MediaQuery.of(context).size.width
                                  ? MediaQuery.of(context).size.width * 0.45
                                  : MediaQuery.of(context).size.width * 0.8,
                              child: Stack(
                                children: [
                                  ProductCard(
                                    controller: controller,
                                    product:
                                        controller.myCartList[index].product,
                                    actions: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          constraints: const BoxConstraints(),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          onPressed: () {
                                            controller.myCartList[index]
                                                        .count <=
                                                    1
                                                ? showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return CustomAlertDialog(
                                                        count: "this",
                                                        title: controller
                                                            .myCartList[index]
                                                            .product
                                                            .title,
                                                        onDelete: () {
                                                          controller
                                                              .deleteProductFromMyCart(
                                                                  controller
                                                                      .myCartList[
                                                                          index]
                                                                      .product);
                                                        },
                                                      );
                                                    })
                                                : controller
                                                    .subtractProductFromMyCart(
                                                        controller
                                                            .myCartList[index]
                                                            .product);
                                          },
                                          icon: const Icon(
                                              Icons.remove_circle_outline),
                                          splashRadius: 20,
                                        ),
                                        Text(
                                            "${controller.myCartList[index].count}"),
                                        IconButton(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            controller.addProductToMyCart(
                                                controller
                                                    .myCartList[index].product);
                                          },
                                          icon: const Icon(
                                              Icons.add_circle_outline_sharp),
                                          splashRadius: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                          splashRadius: 20,
                                          color: Colors.redAccent,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return CustomAlertDialog(
                                                    count: controller
                                                        .myCartList[index].count
                                                        .toString(),
                                                    title: controller
                                                        .myCartList[index]
                                                        .product
                                                        .title,
                                                    onDelete: () {
                                                      controller
                                                          .deleteProductFromMyCart(
                                                              controller
                                                                  .myCartList[
                                                                      index]
                                                                  .product);
                                                    },
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                              Icons.delete_forever_outlined)))
                                ],
                              ));
                        }),
                  ),
            Expanded(
              flex: 4,
              child: Center(
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sub total",
                                    style: subTitleTextStyle,
                                  ),
                                  Text(
                                    "${controller.subTotal.value.toPrecision(2)}",
                                    style: subTitleTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery",
                                    style: subTitleTextStyle,
                                  ),
                                  Text(
                                    "${controller.delivery.value}",
                                    style: subTitleTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: titleTextStyle,
                              ),
                              Text(
                                "\$ ${(controller.subTotal.value + controller.delivery.value).toPrecision(2)}",
                                style: titleTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed:
                                controller.myCartList.isEmpty ? null : () {},
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
        );
      })),
    );
  }
}
