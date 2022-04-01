import 'package:get/get.dart';
import 'package:kev_commerce/domain/models/product.dart';
import 'package:kev_commerce/domain/repository/api_repository.dart';

class CartController extends GetxController{
  final ApiRepositoryInterface apiRepository;

  CartController({required this.apiRepository});

  RxList<Product> productList = <Product>[].obs;

  @override
  onInit(){
    getProducts();
    super.onInit();
  }

  Future<List<Product>> getProducts() async {
    productList.value = await apiRepository.getproducts();
    return apiRepository.getproducts();
  }


}
