// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      next_paging: json['next_paging'] as int?,
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'next_paging': instance.next_paging,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      texture: json['texture'] as String,
      wash: json['wash'] as String,
      place: json['place'] as String,
      note: json['note'] as String,
      story: json['story'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => ColorInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
      main_image: json['main_image'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'texture': instance.texture,
      'wash': instance.wash,
      'place': instance.place,
      'note': instance.note,
      'story': instance.story,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
      'sizes': instance.sizes,
      'variants': instance.variants.map((e) => e.toJson()).toList(),
      'main_image': instance.main_image,
      'images': instance.images,
    };

ColorInfo _$ColorInfoFromJson(Map<String, dynamic> json) => ColorInfo(
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ColorInfoToJson(ColorInfo instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      color_code: json['color_code'] as String,
      size: json['size'] as String,
      stock: json['stock'] as int,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'color_code': instance.color_code,
      'size': instance.size,
      'stock': instance.stock,
    };
