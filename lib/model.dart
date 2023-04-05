import 'dart:core';

class BannerModel {
  final String imageName;

  BannerModel({required this.imageName});
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
  final String id;
  final String imageName;
  final String item;
  final String price;
  final List<String> colors;
  final List<String> sizes;
  final int stocks;
  final List<String> images;

  ProductModel(
      {required this.id,
      required this.imageName,
      required this.item,
      required this.price,
      required this.colors,
      required this.sizes,
      required this.stocks,
      required this.images});
}

// class ColorModel {
//   final String color;
//   final List<SizeModel> size;

//   ColorModel({
//     required this.color,
//     required this.size,
//   });
// }

// class SizeModel {
//   final String size;
//   final int stock;

//   SizeModel({required this.size, required this.stock});
// }
