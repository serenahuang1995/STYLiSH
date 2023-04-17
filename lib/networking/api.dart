import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stylish/product_model.dart';

class Api {
  // late Dio dio;

  late Dio dio = Dio(BaseOptions(baseUrl: 'https://api.appworks-school.tw/api/1.0'));


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

  void getHttp() async {
    try {
      Response response = await dio.get('/products/all');
      List<dynamic> jsonList = response.data['data'];
      // List<Product> productList = jsonList.map((json) => Product.fromJson(json)).toList();
      // return ProductList(data: productList);
      // var data = jsonDecode(jsonList.toList().toString());
      // var list =ProductList.fromJson(data);
      print(jsonList);
       
      // for (var item in jsonList) {
      //   Product product = Product.fromJson(item);
      //   print(product);
      // }


    } catch (e) {
      print(e);
    }
  }
}
