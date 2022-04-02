import 'package:kev_commerce/domain/models/rating.dart';

class Product {
  // Product's variables all required.

  //id: identify the product
  final String id;
  //title: the name of the product
  final String title;
  //price: the price of the prodyct
  final double price;
  final String description;
  final String category;
  //imageUrl: image od the product
  final String imageUrl;
  //Rating: object contains 'rate' and 'count' to know the ~score~ 
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });
}
