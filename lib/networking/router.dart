import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();


// void request() async {
//   Response response;
//   response = await dio.get('/test?id=12&name=dio');
//   print(response.data.toString());
//   // The below request is the same as above.
//   response = await dio.get(
//     '/test',
//     queryParameters: {'id': 12, 'name': 'dio'},
//   );
//   print(response.data.toString());
// }

// Enum Router {
//   products(String type)
// }


enum Router {
   productList
}