import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:kev_commerce/domain/models/product.dart';
import 'package:kev_commerce/domain/models/rating.dart';
import 'package:kev_commerce/domain/repository/api_repository.dart';



class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<List<Product>> getproducts() async {
    var url = "https://fakestoreapi.com/products";
    List<Product> productsListAux = [];
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      //add entity from the response to the auxiliary list
      for (var item in jsonData) {
        productsListAux.add(
          Product(id: int.parse(item["id"].toString()), title: item["title"], price: double.tryParse(item["price"].toString())!, description: item["description"]??"", category: item["category"]??"", imageUrl: item["image"], rating: Rating(rate: double.parse(item["rating"]["rate"].toString()), count: item["rating"]["count"]??0))
        );
      }
    }else{
      //show error if response status code != 200
      Get.snackbar("Error getting data", "Connexion failed");
    }
    return productsListAux;
  }
  
}