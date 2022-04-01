import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      child: MaterialButton(
                    onPressed: (){
                      print("object");
                    },
                    child: Column(
                        children: [
                          Row(
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
                                      cartController.productList[index].imageUrl,
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
                                          cartController.productList[index].title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "\n${cartController.productList[index].description}",
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                            "\n\$ ${cartController.productList[index].price}"),
                                      ]
                                      // contentPadding: const EdgeInsets.all(10),
                                      // shape: ,
                                      ),
                                ),
                              ),
                            ],
                          ),
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
