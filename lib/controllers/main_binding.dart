import 'package:get/get.dart';
import 'package:kev_commerce/data/data_source.dart/api_repository_impl.dart';
import 'package:kev_commerce/data/local_repository_impl.dart';
import 'package:kev_commerce/domain/repository/api_repository.dart';
import 'package:kev_commerce/domain/repository/local_repository.dart';

//Dependency injection 
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRepositoryInterface>(() => ApiRepositoryImpl());
    Get.lazyPut<LocalRepositoryInterface>(() => LocalRepositoryImpl());
  }
  
}