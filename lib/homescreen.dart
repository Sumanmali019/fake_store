import 'package:fake_ecommers_application/service/product.dart';
import 'package:fake_ecommers_application/widget/product_details.dart';
import 'package:fake_ecommers_application/widget/products.dart';
import 'package:fake_ecommers_application/widget/products_scren.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyHomePage extends StatelessWidget {
  final FakeStoreService fakeStoreService = FakeStoreService();
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fake store',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fakeStoreService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Map<String, dynamic>> products = snapshot.data!;
              // Extract unique categories
              List<String> uniqueCategories = products
                  .map<String>((product) => '${product['category']}')
                  .toSet()
                  .toList();
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: uniqueCategories.length,
                itemBuilder: (context, categoryIndex) {
                  String currentCategory = uniqueCategories[categoryIndex];
                  List<Map<String, dynamic>> categoryProducts = products
                      .where((product) =>
                          '${product['category']}' == currentCategory)
                      .toList();
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    physics:const  BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const Gap(20),
                        Products(
                          currentCategory,
                        ),
                        const Gap(8),
                        for (int index = 0;
                            index < categoryProducts.length;
                            index++)
                          ProductDetails(
                            '${categoryProducts[index]['image']}',
                            '${categoryProducts[index]['title']}',
                            '${categoryProducts[index]['price']}',
                            '${categoryProducts[index]['description']}',
                            '${ categoryProducts[index]['rating']['rate'].toDouble()}',
                          ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
