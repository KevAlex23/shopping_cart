import 'package:kev_commerce/domain/models/product.dart';

class Cart {
  final Product product;
  final int count;

  Cart({required this.product,required this.count});
}