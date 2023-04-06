// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:stylish/model.dart';

class DescribeView extends StatefulWidget {
  final ProductModel product;
  final double width;
  const DescribeView({Key? key, required this.product, required this.width})
      : super(key: key);

  @override
  State<DescribeView> createState() => _DescribeViewState();
}

class _DescribeViewState extends State<DescribeView> {
  late final ProductModel product;
  late final double width;
  final String describe =
      '實品顏色依單品照為主\n棉 100%\n厚薄：薄\n彈性：無\n素材產地 / 日本\n加工產地 / 中國';
  int _count = 1;

  @override
  void initState() {
    super.initState();
    product = widget.product;
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 600;
    if (isDesktop) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/product1.jpeg',
              // fit: BoxFit.fill,
              height: 400,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 8),
              child: configureDescribeView(product),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/product1.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: configureDescribeView(product),
          ),
        ],
      );
    }
  }

  Widget configureDescribeView(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.item,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          product.id.toString(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          product.price,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: width,
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
        configureProductColors(product),
        const SizedBox(
          height: 10,
        ),
        configureProductSize(product),
        const SizedBox(
          height: 10,
        ),
        congigureProductStock(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: width,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                '請選擇尺寸',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 50, 49, 49)),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          describe,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none),
        )
      ],
    );
  }
}

extension DescribeViewExtension on _DescribeViewState {
  // configure color & size
  Widget configureProductColors(ProductModel product) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          '顏色',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          '|',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 20,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: product.colors.length,
              itemBuilder: colorItemBuilder),
        )
      ],
    );
  }

  Widget? colorItemBuilder(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 20,
      // height: 10,
      color: Color(int.parse(product.colors[index], radix: 16) + 0xFF000000),
    );
  }

  Widget configureProductSize(ProductModel product) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          '尺寸',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          '|',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 25,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: product.sizes.length,
              itemBuilder: sizeItemBuilder),
        )
      ],
    );
  }

  Widget? sizeItemBuilder(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.blueGrey),
      width: 30,
      child: Center(
          child: Text(
        product.sizes[index],
        style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none),
      )),
    );
  }

  void increase() {
    setState(() {
      _count++;
    });
  }

  void decrease() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

  Widget congigureProductStock() {
    return Row(
      children: [
        const Text(
          '數量',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          '|',
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
        ElevatedButton(
          onPressed: () {
            decrease();
          },
          child: Center(
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 10,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 15,
                )),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: CircleBorder(),
              fixedSize: const Size(20, 20)),
        ),
        SizedBox(
          width: 200,
          child: Text(
            '$_count',
            style: const TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            increase();
          },
          child: Center(
            child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 10,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                )),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: CircleBorder(),
              fixedSize: const Size(20, 20)),
        ),
      ],
    );
  }
}
