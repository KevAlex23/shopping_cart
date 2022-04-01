import 'package:flutter/material.dart';
import 'package:kev_commerce/domain/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10),
              height:
                  MediaQuery.of(context).size.height * 0.2,
              width:
                  MediaQuery.of(context).size.height * 0.2,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.contain,
              )),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(
                left: 10, right: 10, top: 10),
            child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    "\n${product.description}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      "\n\$ ${product.price}"),
                ]
                // contentPadding: const EdgeInsets.all(10),
                // shape: ,
                ),
          ),
        ),
      ],
    );
  }
}