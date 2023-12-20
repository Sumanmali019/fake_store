// product_details_screen.dart

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final String productRating; // Updated to double type for rating

  ProductDetailsScreen({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.productRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: $productName',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                Text('Description: $productDescription' ,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
               const Gap(20),
                Text(
                  'Rating: $productRating',
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
