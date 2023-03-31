
import 'package:flutter/material.dart';
import 'package:stylish/bannerView.dart';
import 'package:stylish/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STYLiSH',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key /*, required this.image*/});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final Image image;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final List<BannerModel> images = 
      List.generate(15,(_) => 'assets/images/banner.jpeg')
      .map((path) => BannerModel(imageName: path))
      .toList();

  final List<CategoryModel> categories = [
    CategoryModel(
      title: '女裝', 
      products: List.generate(5, (index) => ProductModel(imageName: 'assets/images/item.jpeg', item: 'UNIQLO 特級極輕羽絨外套', price: 'NT 323')).toList(),
    ),
    CategoryModel(
      title: '男裝', 
      products: List.generate(15, (index) => ProductModel(imageName: 'assets/images/item.jpeg', item: 'UNIQLO 特級極輕羽絨外套', price: 'NT 323')).toList(),
    ),
    CategoryModel(
      title: '配件', 
      products: List.generate(10, (index) => ProductModel(imageName: 'assets/images/item.jpeg', item: 'UNIQLO 特級極輕羽絨外套', price: 'NT 323')).toList(),
    ),
  ];

  Widget buildListView({ required bool isDesktop }) {

    if (isDesktop) {
     return  Visibility(
        visible: isDesktop,
        child: Column(
          children: [
            ListTile(title: Text('123455677777777'),),
              Expanded(
              child: ListView.separated(
                itemBuilder: itemBuilder, 
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10,);
                }, 
                itemCount: categories.length
                ),
            )
          ]
        ),
        );
    } else {
      return Visibility(
        visible: !isDesktop,
        child:            
         ExpansionTile(
              title: Text('qweeeeeeee'),
              initiallyExpanded: true,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: itemBuilder, 
                  itemCount: 14
                  ),
              ],
            ),  
      );





    }







  //     if (isDesktop) {
  //   return Column(
  //     children: [
  //       ListTile(title: Text('qweeeeeeee'),),
  //       Expanded(
  //         child: ListView.builder(
  //           itemBuilder: itemBuilder, 
  //           itemCount: 14,
  //         ),
  //       )
  //     ],
  //   );
  // } else {
  //   return Column(
  //     children: [
  //       Visibility(
  //         visible: !isDesktop,
  //         child: ExpansionTile(
  //           title: Text('qweeeeeeee'),
  //           initiallyExpanded: true,
  //           children: [
  //             ListView.builder(
  //               shrinkWrap: true,
  //               physics: const NeverScrollableScrollPhysics(),
  //               itemBuilder: itemBuilder, 
  //               itemCount: 14
  //             ),
  //           ],
  //         ),
  //       ),
  //       Visibility(
  //         visible: isDesktop,
  //         child: Expanded(
  //           child: ListView.builder(
  //             itemBuilder: itemBuilder, 
  //             itemCount: 14,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  }



  @override
  Widget build(BuildContext context) {

    final bool isDesktop = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png', height: 25),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            BannerView(),
            ListTile(title: Text('123455677777777'),),
              Expanded(
              child: ListView.separated(
                itemBuilder: itemBuilder, 
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10,);
                }, 
                itemCount: categories.length,
                ),
            )
          ],
        )
    );


            // ExpansionTile(
            //   title: Text('qweeeeeeee'),
            //   initiallyExpanded: true,
            //   children: [
            //     ListView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: itemBuilder, 
            //       itemCount: 14
            //       ),
            //   ],
            // ),  

                        // ListTile(title: Text('123455677777777'),),
            // Expanded(
            //   child: ListView.separated(
            //     itemBuilder: itemBuilder, 
            //     separatorBuilder: (context, index) {
            //       return const SizedBox(height: 10,);
            //     }, 
            //     itemCount: categories.length
            //     ),
            // )
            // buildListView(isDesktop: isDesktop,)




            // ExpansionTile(
            //   title: Text('qweeeeeeee'),
            //   initiallyExpanded: true,
            //   children: [
            //     ListView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: itemBuilder, 
            //       itemCount: 14
            //       ),
            //   ],
            // ),   

      // Visibility(
      //   visible: !isDesktop,
      //   child:            
      //    ExpansionTile(
      //         title: Text('qweeeeeeee'),
      //         initiallyExpanded: true,
      //         children: [
      //           Expanded(
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               physics: const NeverScrollableScrollPhysics(),
      //               itemBuilder: itemBuilder, 
      //               itemCount: 14
      //               ),
      //           ),
      //         ],
      //       ),  
      // ),

                    // Expanded(
            //   child: ListView.separated(
            //     itemBuilder: itemBuilder, 
            //     separatorBuilder: (context, index) {
            //       return const SizedBox(height: 10,);
            //     }, 
            //     itemCount: categories.length
            //     ),
            // )

            
    // Column(
    //   children: [
    //     Container(
    //       margin: const EdgeInsets.symmetric(vertical: 20),
    //       height: 200,
    //       // color: Colors.blue,
    //       child: GridView.count(
    //         padding: const EdgeInsets.only(left: 10),
    //         childAspectRatio: 0.55,
    //         scrollDirection: Axis.horizontal,
    //         crossAxisCount: 1,
    //         mainAxisSpacing: 15,
    //         children: banner,
    //       ),
    //     ),
    //     Expanded(
    //       child: Row(
    //         children: [
    //           Column(
    //             children: [
    //               Text(
    //                 '女裝',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               Container(
    //                 width: MediaQuery.of(context).size.width / 3,
    //                 // color: Colors.red,
    //                 height: MediaQuery.of(context).size.height - 322,
    //                 child: ListView.separated(
    //                   separatorBuilder: (context, index) {
    //                     return const SizedBox(
    //                       height: 10,
    //                     );
    //                   },
    //                   itemBuilder: itemBuilder,
    //                   itemCount: 50,
    //                   padding: const EdgeInsets.all(10),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               Text(
    //                 '男裝',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               Container(
    //                 width: MediaQuery.of(context).size.width / 3,
    //                 // color: Colors.purple,
    //                 height: MediaQuery.of(context).size.height - 322,
    //                 child: ListView.separated(
    //                   separatorBuilder: (context, index) {
    //                     return const SizedBox(
    //                       height: 10,
    //                     );
    //                   },
    //                   itemBuilder: itemBuilder,
    //                   itemCount: 50,
    //                   padding: const EdgeInsets.all(10),
    //                   // shrinkWrap: true,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Column(
    //             children: [
    //               Text(
    //                 '配件',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //               Container(
    //                 width: MediaQuery.of(context).size.width / 3,
    //                 // color: Colors.green,
    //                 height: MediaQuery.of(context).size.height - 322,
    //                 child: ListView.separated(
    //                   separatorBuilder: (context, index) {
    //                     return const SizedBox(
    //                       height: 10,
    //                     );
    //                   },
    //                   itemBuilder: itemBuilder,
    //                   itemCount: 50,
    //                   padding: const EdgeInsets.all(10),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // ),
    // );
  }

  // Widget? itemBuilder(BuildContext context, int index) {
  //   // List View item
  //   return Container(
  //     height: 150,
  //     clipBehavior: Clip.hardEdge,
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         // color: Colors.yellow,
  //         border: Border.all(color: Colors.black, width: 1)),
  //     // item layout
  //     child: Row(
  //       children: [
  //         ClipRRect(
  //           borderRadius: const BorderRadius.only(
  //               topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
  //           child: Image.asset(
  //             'assets/images/item.png',
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'UNIQLO 特級極輕羽絨外套',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               Text(
  //                 'NT 323',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget? itemBuilder(BuildContext context, int index) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     child: Image.asset(
  //       images[index].imageName,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }


  Widget? itemBuilder(BuildContext context, int index) {
    return Card(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.asset('assets/images/item.png', height: 150,fit: BoxFit.fill,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text('sssss'),
                Text('sssss'),
              ],
              
            ),
          )
        ]
        ),
    );
  }



}
