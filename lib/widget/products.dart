import 'package:flutter/material.dart';

class Products extends StatefulWidget {

  final String productName;

  Products(
    this.productName, {
    Key? key,
  }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade200, 
      child: 
          Text(
            widget.productName.toUpperCase(),
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
