// import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

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
  final List<ColorModel> colors;
  final List<String> images;

  ProductModel(
      {required this.id,
      required this.imageName,
      required this.item,
      required this.price,
      required this.colors,
      required this.images});
}

class ColorModel {
  final String color;
  final List<SizeModel> sizes;

  ColorModel({
    required this.color,
    required this.sizes,
  });
}

class SizeModel {
  final String size;
  final int stock;

  SizeModel({required this.size, required this.stock});
}

// =======================================================

@JsonSerializable(explicitToJson: true)
class ProductList {
  final List<Product> data;
  final int? next_paging;

  ProductList({required this.data, required this.next_paging});

    factory ProductList.fromJson(Map<String, dynamic> json) {
    return _$ProductListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Product {
  final int id;
  final String category;
  final String title;
  final String description;
  final int price;
  final String texture;
  final String wash;
  final String place;
  final String note;
  final String story;
  final List<ColorInfo> colors;
  final List<String> sizes;
  final List<Variant> variants;
  final String main_image;
  final List<String> images;

  Product(
      {required this.id,
      required this.category,
      required this.title,
      required this.description,
      required this.price,
      required this.texture,
      required this.wash,
      required this.place,
      required this.note,
      required this.story,
      required this.colors,
      required this.sizes,
      required this.variants,
      required this.main_image,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}

@JsonSerializable(explicitToJson: true)
class ColorInfo {
  final String code;
  final String name;

  ColorInfo({required this.code, required this.name});

  factory ColorInfo.fromJson(Map<String, dynamic> json) {
    return _$ColorInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ColorInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Variant {
  final String color_code;
  final String size;
  final int stock;

  Variant({required this.color_code, required this.size, required this.stock});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return _$VariantFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}
