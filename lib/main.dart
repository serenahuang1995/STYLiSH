import 'package:flutter/material.dart';
import 'package:stylish/home/bannerView.dart';
import 'package:stylish/model.dart';
import 'package:stylish/home/categoryListView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STYLiSH',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<ColorModel> colors = [
      ColorModel(
        color: 'FF0000', 
      size: [
        SizeModel(size: 'S', stock: 10),
        SizeModel(size: 'M', stock: 14),
        SizeModel(size: 'L', stock: 5),
      ]),
      ColorModel(
        color: 'FFD306', 
        size: [
        SizeModel(size: 'S', stock: 3),
        // SizeModel(size: 'M', stock: 9),
        SizeModel(size: 'L', stock: 12),
      ]),
      ColorModel(
        color: 'FFD9EC', 
        size: [
        SizeModel(size: 'S', stock: 0),
        SizeModel(size: 'M', stock: 1),
        // SizeModel(size: 'L', stock: 2),
      ])
    ];

  final List<String> images = [
    'assets/images/product1.jpeg',
    'assets/images/product2.jpeg',
    'assets/images/product3.jpeg',
    'assets/images/product4.jpeg'
  ];

  late final List<CategoryModel> categories = [
    CategoryModel(
      title: '女裝',
      products: List.generate(
          5,
          (index) => ProductModel(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              imageName: 'assets/images/item.png',
              item: 'UNIQLO 特級極輕羽絨外套',
              price: 'NT 323',
              colors: colors,
              // sizes: sizes,
              // stocks: 10,
              images: images)).toList(),
    ),
    CategoryModel(
      title: '男裝',
      products: List.generate(
          15,
          (index) => ProductModel(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              imageName: 'assets/images/item.png',
              item: 'UNIQLO 特級極輕羽絨外套',
              price: 'NT 323',
              colors: colors,
              // sizes: sizes,
              // stocks: 16,
              images: images)).toList(),
    ),
    CategoryModel(
      title: '配件',
      products: List.generate(
          10,
          (index) => ProductModel(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              imageName: 'assets/images/item.png',
              item: 'UNIQLO 特級極輕羽絨外套',
              price: 'NT 323',
              colors: colors,
              // sizes: sizes,
              // stocks: 3,
              images: images)).toList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png', height: 25),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            BannerView(),
            Expanded(
                child: CategoryView(
              categories: categories,
            ))
          ],
        ));
  }
}
