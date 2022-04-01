import 'package:kev_commerce/domain/models/product.dart';

/*abstract class made for 'Software scalability', models, bussiness/domain logic and optimize the resource.
here are all the methods to obtain the data, with this interface it will be easy to change in the future if the products will be obtained in another way
*/
abstract class ApiRepositoryInterface {
  Future<List<Product>> getproducts();
}