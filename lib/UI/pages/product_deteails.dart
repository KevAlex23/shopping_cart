import 'package:flutter/material.dart';
import 'package:kev_commerce/UI/widget/product_card.dart';
import 'package:kev_commerce/domain/models/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          color: Colors.grey.shade50
        ),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            ProductCard(product: Product(id: "id".toString(), title: "title", price: double.tryParse("0.1".toString())!, description: "description", category: "category", imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")),  
            Center(child: Text("Cart"),),
            ElevatedButton(onPressed: (){}, child: Text("datas"))
          ],
        ),
      ),
    );
  }
}