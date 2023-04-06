import 'package:flutter/material.dart';
import 'package:stylish/model.dart';

class BannerView extends StatelessWidget {
  BannerView({
    super.key,
  });

  // final int itemCount;
  final List<BannerModel> images =
      List.generate(15, (_) => 'assets/images/banner.jpeg')
          .map((path) => BannerModel(imageName: path))
          .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.55,
          mainAxisSpacing: 15,
        ),
        padding: const EdgeInsets.only(left: 10, top: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        images[index].imageName,
        fit: BoxFit.cover,
      ),
    );
  }
}
