import 'package:get/get.dart';
import 'package:kev_commerce/UI/pages/cart.dart';
import 'package:kev_commerce/UI/pages/home.dart';
import 'package:kev_commerce/UI/pages/product_deteails.dart';
import 'package:kev_commerce/domain/models/product.dart';

class DeliveryRouteName {
  static const String home = '/';
  static const String detailPage = '/details';
  static const String cart = '/cart';  
}

class DeliveryPage {
  static final pages = [
    GetPage(name: DeliveryRouteName.home, page: ()=> const HomeView()),
    GetPage(name: DeliveryRouteName.detailPage, page: ()=> ProductDetails()),
    GetPage(name: DeliveryRouteName.cart, page: ()=> const CartView()),
  ];
}