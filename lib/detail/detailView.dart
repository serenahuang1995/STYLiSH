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
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GradientText('細部說明',
                  style: const TextStyle(fontSize: 14),
                  colors: const [
                    // Color.fromARGB(255, 208, 118, 224),
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
          Image.asset(
            product.images[1],
            // 'assets/images/product3.jpeg',
            fit: BoxFit.fitWidth,
          )
          // ListView.builder(
          //   itemBuilder: itemBuilder,
          //   itemCount: product.images.length,
          //   scrollDirection: Axis.vertical,
          // )
        ],
      ),
    );
  }

  // Widget? itemBuilder(BuildContext context, int index) {
  //   return Image.asset(
  //     product.images[index],
  //     // 'assets/images/product3.jpeg',
  //     fit: BoxFit.fitWidth,
  //   );
  // }
}
