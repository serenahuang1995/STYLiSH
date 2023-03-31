
import 'dart:core';

class BannerModel {
  final String imageName;

  BannerModel({
    required this.imageName
  });
}

class CategoryModel {
  final String title;
  final List<ProductModel> products;

  CategoryModel({
    required this.title,
    required this.products,
  });
}

class ProductModel {
  final String imageName;
  final String item;
  final String price;

  ProductModel({
    required this.imageName,
    required this.item,
    required this.price,
  });
}

