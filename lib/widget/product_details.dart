import 'package:fake_ecommers_application/widget/products_scren.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  final String? urlImage;
  final String productDetails;
  final String ?productPrice;
   final String ?productD;
  final String ?productPR;
  const ProductDetails(this.urlImage, this.productDetails, this.productPrice, this.productD, this.productPR,{super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
   void onTapFunction() {
    // Navigate to ProductDetailsScreen when ProductDetails is tapped
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailsScreen(
        imageUrl: widget.urlImage!,
        productName: widget.productDetails,
        productDescription: widget.productD!, // Provide actual data
        productRating: widget.productPR!, // Provide actual data
      ),
    ),
  );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              // backgroundImage: NetworkImage(widget.urlImage!),
              radius: 180,
              child: Image.network(
                widget.urlImage!,
                height: 700, // Adjust the height as needed
              ),
            ),
            const Gap(40),
            Text(
              widget.productDetails,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
             const Gap(15),
            Text(
              widget.productPrice!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
             const Gap(80),
          ],
          
        ),
      ),
    );
  }
}
