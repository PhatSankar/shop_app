

import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

class DetailScreen extends StatelessWidget {
  Product product;
  DetailScreen(Product this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
    );
  }
}
