import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Total"),
            Text("\$valor")
          ],),

          Center(child: Text("Cart"),),
          ElevatedButton(onPressed: (){}, child: Text("data"))
        ],
      ),
    );
  }
}