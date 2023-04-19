import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/detail/cubit/product_cubit.dart';
import 'package:stylish/extension/widget_modifier_extension.dart';
import 'package:stylish/detail/view/describe_view.dart';
import 'package:stylish/detail/view/detail_view.dart';
import 'package:stylish/product_model.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 600;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 25),
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double width = isDesktop ? 900 : constraints.maxWidth - 20;
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  BlocProvider(
                    create: (context) => CounterCubit(),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: width),
                        child: DescribeView(product: product,width: width,)
                        ).addPadding(8),
                  ),
                  Container(
                      constraints: BoxConstraints(maxWidth: width),
                      child: DetailView(product: product, width: width)
                      ).addPadding(8)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
