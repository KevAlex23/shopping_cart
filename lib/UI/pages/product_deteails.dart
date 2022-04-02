import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/UI/widget/tag_widget.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';
import 'package:kev_commerce/domain/models/product.dart';

class ProductDetailsView extends GetWidget<CartController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = controller.productList.first;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            color: Colors.grey.shade50),
        child: Column(
          children: [
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Image.network(product.imageUrl),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        product.title,
                        style: titleTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(product.description, style: contentTextStyle,)
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_border_rounded,color: Colors.amberAccent),
                        Text(" ${product.rating.rate}")
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.group),
                        Text(" ${product.rating.count}"),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(children: [
              TagWidget(category: product.category),
              const Expanded(child: SizedBox()),
              Text("\$ ${product.price}", style: titleTextStyle,)
            ],),

          ],
        ),
      ),
    );
  }
}
