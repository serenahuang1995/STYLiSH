import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stylish/product_model.dart';

class Api {

  // Future<Map<String, dynamic>> fetch(String service,
  //     {Map<String, dynamic>? }) async {
  //   try {
  //     var res = await dio.get('/products/all');
  //     return res.data;
  //   } catch (e) {
  //     print(e.toString());
  //     return {};
  //   }
  // }

      //   var jsonResponse = response.data;
      // ProductList list = ProductList.fromJson(json.decode(jsonResponse));
      // return list.data;

  Future<List<Product>> getMenProduct() async {
    try {
      Response response = await Dio().get('https://api.appworks-school.tw/api/1.0/products/men');
      Map<String, dynamic> data = jsonDecode(response.toString());
      var list = ProductList.fromJson(data);
      return list.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

    Future<List<Product>> getWomenProduct() async {
    try {
      Response response = await Dio().get('https://api.appworks-school.tw/api/1.0/products/women');
      Map<String, dynamic> data = jsonDecode(response.toString());
      var list = ProductList.fromJson(data);
      return list.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

    Future<List<Product>> getAccessoryProduct() async {
    try {
      Response response = await Dio().get('https://api.appworks-school.tw/api/1.0/products/accessories');
      Map<String, dynamic> data = jsonDecode(response.toString());
      var list = ProductList.fromJson(data);
      return list.data;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
