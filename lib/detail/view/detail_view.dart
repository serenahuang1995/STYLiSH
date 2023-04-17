import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stylish/share/custom_text.dart';
import 'package:stylish/extension/widget_modifier_extension.dart';
import 'package:stylish/product_model.dart';

class DetailView extends StatelessWidget {
  final ProductModel product;
  final double width;
  const DetailView({Key? key, required this.product, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GradientText('細部說明',
                style: const TextStyle(fontSize: 18),
                colors: const [
                  Color.fromARGB(255, 3, 138, 248),
                  Color.fromARGB(255, 12, 235, 19)
                ]),
            Expanded(
              child: Container(
                color: Colors.grey,
                height: 1,
              ).addPaddingOnly(left: 8),
            )
          ],
        ),
        NornalText(text: '手工印刷，每一件的圖案位置會有一點點不一樣', size: 16, color: Colors.black).addPaddingOnly(top: 5, bottom: 5),
        ListView.builder(
          itemBuilder: itemBuilder,
          itemCount: product.images.length,
          // 因為 ListView 本身就是一個可滾動的 widget，DetailView 已經被放進可滾動的 SingleChildScrollView 中
          // 嵌套了兩個可滾動的 widget 會報錯 ，所以要設定 shrinkWrap ＆ physics
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        )
        // 用 Wrap 一樣可以達到效果
        // Wrap(
        //   children: product.images.map((image) => Image.asset(image, fit: BoxFit.fitWidth,)).toList(),
        // )
      ],
    ).addPadding(8);
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Image.asset(
      product.images[index],
      fit: BoxFit.fitWidth,
    );
  }
}
