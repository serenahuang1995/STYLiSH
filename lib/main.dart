import 'package:flutter/material.dart';
import 'package:stylish/home/view/banner_view.dart';
import 'package:stylish/home/view/category_view.dart';

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
              child: CategoryView(),
            )
          ],
        ));
  }
}
