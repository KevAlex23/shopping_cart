import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kev_commerce/domain/models/cart_aux_model.dart';
import 'package:kev_commerce/domain/models/product.dart';
import 'package:kev_commerce/domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  final _cart = const FlutterSecureStorage();

  // IOSOptions _getIOSOptions() => IOSOptions(
  //       accountName: _getAccountName(),
  //     );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  Future<List<CartAux>> getMyCartProducts() async {
    List<CartAux> productsAuxList = [];
    final all = await _cart.readAll(aOptions: _getAndroidOptions());
    productsAuxList = all.entries
        .map((entry) => CartAux(productID: entry.key, count: entry.value))
        .toList(growable: false);

    return productsAuxList;
  }

  @override
  addProductToMyCart(Product product) async {
    int count = await cartContainsProduct(product.id.toString());
    count++;
    _cart.write(key: product.id.toString(), value: count.toString(), aOptions: _getAndroidOptions());
  }

  @override
  Future<void> subtractProductFromMyCart(Product product) async {
    int count = await cartContainsProduct(product.id.toString());
    count--;
    count <= 0
        ? _cart.delete(key: product.id.toString(),aOptions: _getAndroidOptions())
        : _cart.write(key: product.id.toString(), value: count.toString(), aOptions: _getAndroidOptions());
  }

  @override
  Future<int> cartContainsProduct(String productID) async {
    int count = 0;
    String? countAux =
        await _cart.read(key: productID, aOptions: _getAndroidOptions());
    if (countAux != null) count = int.parse(countAux);
    return count;
  }

  @override
  Future<void> deleteProductFromMyCart(Product product) async {
    _cart.delete(key: product.id.toString(),aOptions: _getAndroidOptions());
  }

  @override
  Future<void> deleteAllProductsMyCart() async {
    _cart.deleteAll(aOptions: _getAndroidOptions());
  }
}
