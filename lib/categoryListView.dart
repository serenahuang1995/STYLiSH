
import 'package:flutter/material.dart';
import 'package:stylish/model.dart';

class CategoryView extends StatelessWidget {

  CategoryView({ super.key });


  final List<CategoryModel> categories = [
    CategoryModel(
      title: '女裝', 
      products: List.generate(5, (index) => ProductModel(imageName: 'assets/images/item.jpeg', item: 'UNIQLO 特級極輕羽絨外套', price: 'NT 323')).toList(),
    ),
    CategoryModel(
      title: '男裝', 
      products: List.generate(15, (index) => ProductModel(imageName: 'assets/images/item.jpeg', item: 'UNIQLO 特級極輕羽絨外套', price: 'NT 323')).toList(),
    ),
    CategoryModel(
      title: '配件', 
      products: List.generate(10, (index) => ProductModel(imageName: 'assets/images/item.jpeg', item: 'UNIQLO 特級極輕羽絨外套', price: 'NT 323')).toList(),
    ),
  ];




}