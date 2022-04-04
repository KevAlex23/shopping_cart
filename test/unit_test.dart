import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:kev_commerce/controllers/cart_controller.dart';
import 'package:kev_commerce/controllers/main_binding.dart';
import 'package:kev_commerce/data/data_source.dart/api_repository_impl.dart';
import 'package:kev_commerce/domain/models/product.dart';
import 'package:kev_commerce/domain/repository/api_repository.dart';

void main() {
  test('Get a list of products when they are called from the api, then this list is not Empty', () async {
    // arrange
    ApiRepositoryInterface apiRepository = ApiRepositoryImpl();

    // act
    List<Product> productListTest = [];
    productListTest = await apiRepository.getproducts();

    // assert
    expect(productListTest, isNotEmpty);

  });

  test('Given an ID when use "findProductByID(ID)", then get a product ', () async {
    // arrange
    MainBinding().dependencies();
    final controller = Get.put<CartController>(CartController(Get.find(), Get.find()));
    await controller.getProducts();
    // act
    Product product = controller.findProductByID(1);

    // assert
    expect(product, isNotNull);

  });
}
