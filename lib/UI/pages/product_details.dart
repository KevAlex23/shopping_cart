import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/UI/widget/tag_widget.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';
import 'package:kev_commerce/domain/models/product.dart';

class ProductDetailsView extends GetView<CartController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //arguments get the data provide by the url to use Deep Links
    final arguments = (ModalRoute.of(context)?.settings.arguments);
    Product product = controller.findProductByID(arguments as int);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: product==null? Center(child: Column(children: const [Icon(Icons.remove_shopping_cart_outlined) ,Text("the product doesn't exist")],)) : OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                color: Colors.grey.shade50),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    orientation == Orientation.landscape?Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.25,
                      height:  MediaQuery.of(context).size.height*0.3,
                      child: Image.network(product.imageUrl),
                    ):Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.25,
                      // height:  MediaQuery.of(context).size.height*0.3: double.minPositive,
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
                          Container(
                            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.2),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Text(product.description, style: contentTextStyle,)))
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
                  const Spacer(),
                  Text("\$ ${product.price}", style: titleTextStyle,)
                ],),

              ],
            ),
          );
        }
      ),
    );
  }
}
