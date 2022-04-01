import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/UI/pages/cart.dart';
import 'package:kev_commerce/UI/pages/product_deteails.dart';
import 'package:kev_commerce/UI/widget/product_card.dart';
import 'package:kev_commerce/const/const_colors.dart';
import 'package:kev_commerce/controllers/cart_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController =
        Get.put<CartController>(CartController(apiRepository: Get.find()));
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Kev Commerce"),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> CartView()));
        }, icon: Icon(Icons.shopping_cart_rounded))],
      ),
      body: Obx(() {
        return cartController.productList.isEmpty
            ? const Center(
                child: Text("Empty"),
              )
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartController.productList.length,
                itemBuilder: (context, index) {
                  int count = 0;
                  return Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                    onTap: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                        context: context, builder: (_)=>Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.3,),
                          Center(child: Container(
                            margin: EdgeInsets.all(10),
                            height: 10, width: 40, decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(20)))),
                          const Expanded(child: ProductDetails()),
                        ],
                      ));
                    },
                    child: Column(
                        children: [
                          ProductCard(product: cartController.productList[index]),
                          Row(
                            children: [
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_circle_outline),
                                    splashRadius: 20,
                                  ),
                                  Text("${count}"),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_circle_outline_sharp),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
      }),
    );
  }
}


