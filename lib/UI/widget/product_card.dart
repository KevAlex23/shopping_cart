import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kev_commerce/UI/pages/product_details.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';
import 'package:kev_commerce/domain/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.actions,
    required this.controller,
  }) : super(key: key);

  final Product product;
  final Widget actions;
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            showModalBottomSheet(
                routeSettings: RouteSettings(arguments: product.id),
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => OrientationBuilder(
                  builder: (context, orientation) {
                    return Column(
                          children: [
                            InkWell(
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              onTap: () => Navigator.pop(context),
                              child: SizedBox(
                                width: double.maxFinite,
                                height:MediaQuery.of(context).size.height<MediaQuery.of(context).size.width? 10: MediaQuery.of(context).size.height * 0.3,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Center(
                                child: Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 10,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius: BorderRadius.circular(20)))),
                            // orientation == Orientation.portrait? const  Expanded(child: ProductDetailsView()): const Expanded(child: Card(child: Text("data"),)),
                            const  Expanded(child: ProductDetailsView()),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(0))),
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
                                  controller.addProductToMyCart(product).then(
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
                                              "The product ${product.title} was successfully added!",
                                              icon: Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: primaryColor),
                                                  duration: const Duration(seconds: 1),
                                              borderWidth: 2,
                                              borderColor: primaryColor,
                                              backgroundColor:
                                                  cardBackgroundColor));
                                })
                          ],
                        );
                  }
                ));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.height * 0.2,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.contain,
                        )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "\n${product.description}",
                              maxLines: MediaQuery.of(context).size.height<MediaQuery.of(context).size.width?2:4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.star_border_rounded,
                                            color: Colors.amberAccent),
                                        Text(" ${product.rating.rate}")
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  "\$ ${product.price}",
                                  style: titleTextStyle,
                                ),
                              ],
                            ),
                          ]
                          ),
                    ),
                  ),
                ],
              ),
              actions
            ],
          ),
        ));
  }
}
