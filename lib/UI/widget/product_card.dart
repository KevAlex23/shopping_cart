import 'package:flutter/material.dart';
import 'package:kev_commerce/UI/pages/product_deteails.dart';
import 'package:kev_commerce/const/style_const.dart';
import 'package:kev_commerce/domain/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.actions,
  }) : super(key: key);

  final Product product;
  final Widget actions;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => Column(
                      children: [
                        InkWell(
                          splashFactory: NoSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          onTap: () => Navigator.pop(context),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ),
                        Center(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                height: 10,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(20)))),
                        const Expanded(child: ProductDetailsView()),
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
                            onPressed: () {})
                      ],
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "\n${product.description}",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10,),
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
                                const Expanded(child: SizedBox()),
                                Text(
                                  "\$ ${product.price}",
                                  style: titleTextStyle,
                                ),
                              ],
                            ),
                          ]
                          // contentPadding: const EdgeInsets.all(10),
                          // shape: ,
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
