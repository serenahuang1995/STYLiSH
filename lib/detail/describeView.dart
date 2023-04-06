// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:stylish/Extension/textExtension.dart';
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
    final bool isDesktop = MediaQuery.of(context).size.width >= 900;
    if (isDesktop) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 500,
              width: 450,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    product.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
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
            child: SizedBox(
              height: 500,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    product.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
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
        BoldText(
          text: product.item,
          size: 22,
          color: Colors.black,
        ),
        const SizedBox(
          height: 5,
        ),
        NornalText(
          text: product.id.toString(),
          size: 14,
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        BoldText(
          text: product.price,
          size: 22,
          color: Colors.black,
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
          height: 20,
        ),
        configureProductColors(product),
        const SizedBox(
          height: 30,
        ),
        configureProductSize(product),
        const SizedBox(
          height: 30,
        ),
        congigureProductStock(),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: width,
            height: 50,
            child: TextButton(
              onPressed: () {},
              child: (_count == product.stocks)
                  ? BoldText(text: '已達庫存上限', size: 20, color: Colors.white)
                  : BoldText(text: '請選擇尺寸', size: 20, color: Colors.white),
              // BoldText(text: '請選擇尺寸', size: 20, color: Colors.white),
              style: TextButton.styleFrom(
                  backgroundColor: (_count == product.stocks)
                      ? Colors.grey
                      : Color.fromARGB(255, 50, 49, 49)),
            )),
        const SizedBox(
          height: 20,
        ),
        NornalText(
          text: describe,
          size: 16,
          color: Colors.black,
        ),
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
        NornalText(
          text: '顏色',
          size: 14,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        NornalText(
          text: '|',
          size: 16,
          color: Colors.grey,
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
        NornalText(
          text: '尺寸',
          size: 14,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        NornalText(
          text: '|',
          size: 16,
          color: Colors.grey,
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
          child: NornalText(
              text: product.sizes[index], size: 14, color: Colors.white)),
    );
  }

  void increase() {
    setState(() {
      if (_count < product.stocks) {
        _count++;
      }
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
        NornalText(
          text: '數量',
          size: 14,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        NornalText(
          text: '|',
          size: 16,
          color: Colors.grey,
        ),
        ElevatedButton(
          onPressed: () {
            decrease();
          },
          child: Center(
            child: CircleAvatar(
                backgroundColor: (_count == 1) ? Colors.grey : Colors.black,
                radius: 10,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 15,
                )),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: (_count == 1) ? Colors.grey : Colors.black,
              shape: CircleBorder(),
              fixedSize: const Size(20, 20),
              // enableFeedback: false
              ),
        ),
        SizedBox(
            width: 200,
            child: NornalText(
              text: '$_count',
              size: 16,
              color: Colors.black,
              textAlign: TextAlign.center,
            )),
        ElevatedButton(
          onPressed: () {
            if (_count == product.stocks) {
              Null;
            } else {
              increase();
            }
          },
          child: Center(
            child: CircleAvatar(
                backgroundColor:
                    (_count == product.stocks) ? Colors.grey : Colors.black,
                radius: 10,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 15,
                )),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  (_count == product.stocks) ? Colors.grey : Colors.black,
              shape: CircleBorder(),
              fixedSize: const Size(20, 20),
              // enableFeedback: false
              ),
        ),
      ],
    );
  }
}
