import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kev_commerce/domain/models/cart_aux_model.dart';
import 'package:kev_commerce/domain/models/cart_model.dart';
import 'package:kev_commerce/domain/models/product.dart';
import 'package:kev_commerce/domain/repository/api_repository.dart';
import 'package:kev_commerce/domain/repository/local_repository.dart';

class CartController extends GetxController {
  final ApiRepositoryInterface _apiRepository;
  final LocalRepositoryInterface _localRespository;
  CartController(this._apiRepository, this._localRespository);

  RxList<Product> productList = <Product>[].obs;
  RxList<Cart> myCartList = <Cart>[].obs;

  RxDouble subTotal = 0.0.obs;
  RxDouble delivery = 0.0.obs;

  @override
  onInit() async {
    await getProducts();
    getMyCartProducts();
    super.onInit();
  }

  Future<List<Product>> getProducts() async {
    productList.value = await _apiRepository.getproducts();
    return _apiRepository.getproducts();
  }

  Product findProductByID(int id) {
    late Product productAux;
    try {
      productAux = productList.firstWhere((element) => element.id == id);
    } on StateError catch (e) {
      Get.snackbar("Error", e.message);
    }
    return productAux;
  }

  getMyCartProducts() async {
    List<Cart> myCart = [];
    List<CartAux> myCartAuxList = [];
    myCartAuxList.addAll(await _localRespository.getMyCartProducts());
    for (var item in myCartAuxList) {
      myCart.add(Cart(
          product: findProductByID(int.parse(item.productID)),
          count: int.parse(item.count)));
    }
    myCartList.value = myCart;
    calculateMyCartSubtotal();
    return myCartList;
  }

  Future<String> addProductToMyCart(Product product) async {
    String response = "";
    try {
      await _localRespository
        .addProductToMyCart(product)
        .whenComplete(() => getMyCartProducts());
        calculateMyCartSubtotal();
        response = "done";
    }on PlatformException catch (e) {
      response = e.message!;
    }
    return response;
  }

  subtractProductFromMyCart(Product product) {
    _localRespository
        .subtractProductFromMyCart(product)
        .whenComplete(() => getMyCartProducts());
        calculateMyCartSubtotal();
  }

  deleteProductFromMyCart(Product product) {
    _localRespository
        .deleteProductFromMyCart(product)
        .whenComplete(() => getMyCartProducts());
        calculateMyCartSubtotal();
  }

  deleteAllProductsMyCart(){
    _localRespository.deleteAllProductsMyCart().whenComplete(() => getMyCartProducts());
    calculateMyCartSubtotal();
  }

  calculateMyCartSubtotal() {
    double subTotalAux = 0.0;
    for (var item in myCartList) {
      subTotalAux += item.product.price * item.count;
    }
    subTotal.value = subTotalAux;
  }
}
