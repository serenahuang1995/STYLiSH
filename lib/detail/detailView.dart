import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stylish/model.dart';

class DetailView extends StatelessWidget {
  final ProductModel product;
  final double width;
  const DetailView({Key? key, required this.product, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GradientText('細部說明',
                  style: const TextStyle(fontSize: 14),
                  colors: const [
                    Color.fromARGB(255, 3, 138, 248),
                    Color.fromARGB(255, 12, 235, 19)
                  ]),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text('手工印刷，每一件的圖案位置會有一點點不一樣'),
          ),
          // Image.asset(
          //   product.images[1],
          //   // 'assets/images/product3.jpeg',
          //   fit: BoxFit.fitWidth,
          // )
          ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: product.images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
          // 本來是用了List.builder
          // 但因為 ListView 本身就是一個可滾動的 widget，DetailView 已經被放進可滾動的 SingleChildScrollView 中，嵌套了兩個可滾動的 widget 會報錯
          //由於 ListView 本身就是一個可滾動的 widget，而你已經將 DetailView 放在一個可滾動的 SingleChildScrollView 中，所以這裡的錯誤就是因為嵌套了兩個可滾動的 widget
          // Wrap(
          //   children: product.images.map((image) => Image.asset(image, fit: BoxFit.fitWidth,)).toList(),
          // )
        ],
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Image.asset(
      product.images[index],
      // 'assets/images/product3.jpeg',
      fit: BoxFit.fitWidth,
    );
  }
}
