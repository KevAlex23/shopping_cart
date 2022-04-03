import 'package:kev_commerce/domain/models/cart_aux_model.dart';
import 'package:kev_commerce/domain/models/product.dart';

abstract class LocalRepositoryInterface {
  Future<void> addProductToMyCart(Product product);
  Future<void> subtractProductFromMyCart(Product product);
  Future<void> deleteProductFromMyCart(Product product);
  Future<void> deleteAllProductsMyCart();
  Future<int> cartContainsProduct(String productID);
  Future<List<CartAux>> getMyCartProducts();
}