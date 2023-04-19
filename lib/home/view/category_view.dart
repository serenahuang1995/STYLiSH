import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stylish/networking/api.dart';
import 'package:stylish/share/custom_text.dart';
import 'package:stylish/extension/widget_modifier_extension.dart';
import 'package:stylish/detail/detail_page.dart';
import 'package:stylish/product_model.dart';

class CategoryView extends StatelessWidget {
  // final List<CategoryModel> categories;
  // final List<Product> products;
  // CategoryView({Key? key, required this.categories}) : super(key: key);
  // const CategoryView({Key? key, required this.products}) : super(key: key);
  CategoryView({Key? key}) : super(key: key);

  // List<Product> getWomenProducts() {
  //   return products.where((product) => product.category == 'women').toList();
  // }

  // List<Product> getMenProducts() {
  //   return products.where((product) => product.category == 'men').toList();
  // }

  // List<Product> getAccessoriesProducts() {
  //   return products
  //       .where((product) => product.category == 'accessories')
  //       .toList();
  // }

  List<Product> women = [];
  List<Product> men = [];
  List<Product> accessories = [];

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 950;

    return FutureBuilder(
      future: Future.wait([
        Api().getWomenProduct(),
        Api().getMenProduct(),
        Api().getAccessoryProduct()
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } 
        // else if (!snapshot.hasData) {
        //   return Text('No data');
        // } 
        else {
          women = snapshot.requireData[0];
          men = snapshot.requireData[1];
          accessories = snapshot.requireData[2];
        }

        return configureCategoryList(isDesktop)
            .addPaddingOnly(right: 10, left: 10);
      },
    );
  }

  Widget configureCategoryList(bool isDesktop) {
    if (isDesktop) {
      return Row(
        children: [
          Column(
            children: [
              Center(
                child: ListTile(
                    title: BoldText(
                  text: '女裝',
                  size: 20,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, itemIndex) {
                    return configureProductCard(context, women[itemIndex]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: women.length,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: ListTile(
                    title: BoldText(
                  text: '男裝',
                  size: 20,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, itemIndex) {
                    return configureProductCard(context, men[itemIndex]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: men.length,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: ListTile(
                    title: BoldText(
                  text: '配件',
                  size: 20,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, itemIndex) {
                    return configureProductCard(
                        context, accessories[itemIndex]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: accessories.length,
                ),
              ),
            ],
          )
        ],
        // children: List.generate(categories.length, (index) {
        //   var category = categories[index];
        //   // ListView.separated 套在 Column 中，這可能會導致 Column 的高度無限增長。
        //   // 應該將 Column 包裝在 Expanded 或 Flexible 中，以確保它只使用其父級分配給它的空間。
        //   return Expanded(
        //     child: Column(
        //       children: [
        //         Center(
        //           child: ListTile(
        //             title:
        //             BoldText(text: category.title, size: 20, color: Colors.black, textAlign: TextAlign.center,)
        //           ),
        //         ),
        //         Expanded(
        //           child: ListView.separated(
        //             itemBuilder: (context, itemIndex) {
        //               return configureProductCard(
        //                   context, category.products[itemIndex]);
        //             },
        //             separatorBuilder: (context, index) {
        //               return const SizedBox(
        //                 height: 10,
        //               );
        //             },
        //             itemCount: category.products.length,
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // }),
      );
    } else {
      return SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              Center(
                child: ListTile(
                    title: BoldText(
                  text: '女裝',
                  size: 20,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
              ),
              ListView.builder(
                itemBuilder: (context, itemIndex) {
                  return configureProductCard(context, women[itemIndex]);
                },
                itemCount: women.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: ListTile(
                    title: BoldText(
                  text: '男裝',
                  size: 20,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
              ),
              ListView.builder(
                itemBuilder: (context, itemIndex) {
                  return configureProductCard(context, men[itemIndex]);
                },
                itemCount: men.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: ListTile(
                    title: BoldText(
                  text: '配件',
                  size: 20,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                )),
              ),
              ListView.builder(
                itemBuilder: (context, itemIndex) {
                  return configureProductCard(context, accessories[itemIndex]);
                },
                itemCount: accessories.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ],
          ),
        ]),
        // child: Column(
        //   children: List.generate(categories.length, (index) {
        //     var category = categories[index];
        //     return Column(
        //       children: [
        //         Center(
        //           child: ListTile(
        //             title: BoldText(text: category.title, size: 20, color: Colors.black, textAlign: TextAlign.center,)
        //           ),
        //         ),
        //         ListView.builder(
        //           itemBuilder: (context, itemIndex) {
        //             return configureProductCard(context, category.products[itemIndex]);
        //           },
        //           itemCount: category.products.length,
        //           physics: const NeverScrollableScrollPhysics(),
        //           shrinkWrap: true,
        //         ),
        //       ],
        //     );
        //   }),
        // ),
      );
    }
  }

  // product item
  Widget configureProductCard(BuildContext context, Product product) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                product: product,
              ),
            ));
      },
      child: Card(
        // color: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.network(
              product.main_image,
              // 'assets/images/item.png',
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NornalText(text: product.title, size: 16, color: Colors.black),
              NornalText(
                  text: product.price.toString(),
                  size: 16,
                  color: Colors.black),
            ],
          ).addPadding(10)
        ]),
      ),
    );
  }
}
