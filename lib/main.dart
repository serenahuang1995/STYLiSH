import 'package:flutter/material.dart';
import 'package:stylish/bannerView.dart';
import 'package:stylish/model.dart';
import 'package:stylish/categoryListView.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BannerModel> images =
      List.generate(15, (_) => 'assets/images/banner.jpeg')
          .map((path) => BannerModel(imageName: path))
          .toList();

  final List<CategoryModel> categories = [
    CategoryModel(
      title: '女裝',
      products: List.generate(
          5,
          (index) => ProductModel(
              imageName: 'assets/images/item.jpeg',
              item: 'UNIQLO 特級極輕羽絨外套',
              price: 'NT 323')).toList(),
    ),
    CategoryModel(
      title: '男裝',
      products: List.generate(
          15,
          (index) => ProductModel(
              imageName: 'assets/images/item.jpeg',
              item: 'UNIQLO 特級極輕羽絨外套',
              price: 'NT 323')).toList(),
    ),
    CategoryModel(
      title: '配件',
      products: List.generate(
          10,
          (index) => ProductModel(
              imageName: 'assets/images/item.jpeg',
              item: 'UNIQLO 特級極輕羽絨外套',
              price: 'NT 323')).toList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final bool isDesktop = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png', height: 25),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            BannerView(),
            Expanded(child: CategoryView())
            // List.generate()

            // ListTile(
            //   title: Text('123455677777777'),
            // ),
            // Expanded(
            //   child: ListView.separated(
            //     itemBuilder: itemBuilder,
            //     separatorBuilder: (context, index) {
            //       return const SizedBox(
            //         height: 10,
            //       );
            //     },
            //     itemCount: categories.length,
            //   ),
            // )
          ],
        ));
  }
}
