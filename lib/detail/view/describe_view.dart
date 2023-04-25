// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:developer';
// import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:stylish/detail/cubit/product_cubit.dart';
import 'package:stylish/share/custom_text.dart';
import 'package:stylish/extension/widget_modifier_extension.dart';
import 'package:stylish/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_tappay/flutter_tappay.dart';

class DescribeView extends StatefulWidget {
  // final ProductModel product;
  final Product product;

  final double width;
  const DescribeView({Key? key, required this.product, required this.width})
      : super(key: key);

  @override
  State<DescribeView> createState() => _DescribeViewState();
}

class _DescribeViewState extends State<DescribeView> {
  late final Product product;
  late final double width;
  late PageController _pageController;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _ccvController = TextEditingController();

  // static const platform = MethodChannel('tappay');

  int _count = 1;
  int _isClickColorIndex = 0;
  int _isClickSizeIndex = 0;
  String _result = '尚未付款成功';

  @override
  void initState() {
    super.initState();
    product = widget.product;
    width = widget.width;
    _pageController = PageController(initialPage: _isClickColorIndex);
  }

  // Future<void> makePayment(
  //     String cardNumber, String month, String year, String ccv) async {
  //   try {
  //     final Map<String, dynamic> paymentParams = {
  //       'cardNumber': cardNumber,
  //       'dueYear': year,
  //       'dueMonth': month,
  //       'ccv': ccv,
  //     };
  //   final String result = await platform.invokeMethod('getTapPayToken', paymentParams);
  //     // 使用Token進行付款
  //   } on PlatformException catch (e) {
  //     // 處理異常
  //   }

    // setState(() {
    //   _result = '結果 - ${result}';
    // });
  // }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 900;
    if (isDesktop) {
      return Row(
        children: [
          SizedBox(
            height: 500,
            width: 450,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: product.images.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  product.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ).addPaddingOnly(left: 8),
          Expanded(
            child: configureDescribeView(product)
                .addPaddingOnly(left: 10, right: 8),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: product.images.length,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  product.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ).addPadding(10),
          configureDescribeView(product).addPaddingOnly(left: 10, right: 10),
        ],
      );
    }
  }

  Widget configureDescribeView(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(
          text: product.title,
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
          text: 'NT ${product.price}',
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
        congigureProductStock(product.variants[_isClickSizeIndex]),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: width,
            height: 50,
            child: TextButton(
              onPressed: () {
                showDialog(context: context, builder: builder);
              },
              child: (_count == product.variants[_isClickSizeIndex].stock)
                  ? BoldText(text: '已達庫存上限', size: 20, color: Colors.white)
                  : BoldText(text: '購買', size: 20, color: Colors.white),
              style: TextButton.styleFrom(
                  backgroundColor:
                      (_count == product.variants[_isClickSizeIndex].stock)
                          ? Colors.grey
                          : Color.fromARGB(255, 50, 49, 49)),
            )),
        const SizedBox(
          height: 20,
        ),
        NornalText(
          text:
              '${product.description}\n${product.note}\n${product.place}\n${product.texture}\n${product.wash}',
          size: 16,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget builder(BuildContext context) {
    return Dialog(
      // backgroundColor: Colors.green,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 400,
            child: Column(children: [
              Row(
                children: [
                  Text('卡號'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _cardNumberController,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('有效期限'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _monthController,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _yearController,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text('安全碼'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: _ccvController,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        log(_cardNumberController.text);
                      },
                      child: Text('取消')),
                  SizedBox(width: 20.0),
                  ElevatedButton(onPressed: () {}, child: Text('確定')),
                ],
              ),
              SizedBox(height: 20.0),
              Center(child: Text(_result))
            ]),
          ),
        ),
      ),
    );
  }
}

extension DescribeViewExtension on _DescribeViewState {
  // configure color & size
  Widget configureProductColors(Product product) {
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
        ),
      ],
    );
  }

  void _tapColor(int colorIndex) {
    setState(() {
      _isClickColorIndex = colorIndex;
      _isClickSizeIndex = 0;
      _count = 1;
      _pageController.jumpToPage(_isClickColorIndex);
    });
  }

  void _tapSize(int sizeIndex) {
    setState(() {
      _isClickSizeIndex = sizeIndex;
      _count = 1;
    });
  }

  Widget? colorItemBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () => _tapColor(index),
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        width: 20,
        decoration: BoxDecoration(
            color: Color(
                int.parse(product.colors[index].code, radix: 16) + 0xFF000000),
            border: _isClickColorIndex == index
                ? Border.all(color: Colors.black, width: 2)
                : null),
      ),
    );
  }

  Widget configureProductSize(Product product) {
    final List<Variant> list = product.variants
        .where((variant) =>
            variant.color_code == product.colors[_isClickColorIndex].code)
        .toList();
    log(list.toString());
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
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => _tapSize(index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: _isClickSizeIndex == index
                            ? Color.fromARGB(255, 193, 222, 245)
                            : Colors.blueGrey),
                    width: 30,
                    child: Center(
                        child: NornalText(
                            text: list[index].size,
                            size: 14,
                            color: Colors.white)),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget congigureProductStock(Variant variant) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
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
              onPressed: () => context.read<CounterCubit>().decrement(),
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
              ),
            ),
            SizedBox(
                width: 150,
                child: NornalText(
                  text: '$state',
                  size: 16,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
              onPressed: () => context.read<CounterCubit>().increment(),
              child: Center(
                child: CircleAvatar(
                    backgroundColor:
                        (_count == variant.stock) ? Colors.grey : Colors.black,
                    radius: 10,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    )),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    (_count == variant.stock) ? Colors.grey : Colors.black,
                shape: CircleBorder(),
                fixedSize: const Size(20, 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
