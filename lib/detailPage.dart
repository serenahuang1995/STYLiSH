import 'package:flutter/material.dart';
import 'package:stylish/detail/describeView.dart';
import 'package:stylish/detail/detailView.dart';
import 'package:stylish/model.dart';

class DetailPage extends StatelessWidget {
  final ProductModel product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 600;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 25),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double width = isDesktop ? 800 : constraints.maxWidth - 20;
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: width),
                        // color: Colors.pink,
                        child: DescribeView(
                          product: product,
                          width: width,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: width),
                        // color: Colors.pink,
                        child: DetailView(product: product, width: width)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
