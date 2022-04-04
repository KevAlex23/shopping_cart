import 'package:kev_commerce/domain/models/cart_aux_model.dart';
import 'package:kev_commerce/domain/models/product.dart';

//model to scalable the local storage methods
abstract class LocalRepositoryInterface {
  Future<void> addProductToMyCart(Product product, int count);
  Future<void> subtractProductFromMyCart(Product product, int count);
  Future<void> deleteProductFromMyCart(Product product);
  Future<void> deleteAllProductsMyCart();
  Future<int> cartContainsProduct(String productID);
  Future<List<CartAux>> getMyCartProducts();
}