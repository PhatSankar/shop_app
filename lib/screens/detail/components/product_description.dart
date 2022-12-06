

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';

class ProductDescription extends StatelessWidget {
  final FakeProduct product;
  const ProductDescription(FakeProduct this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPaddin),
      child: Text(
        product.description!!,
        style: TextStyle(height: 1.5),
      ),
    )
    ;
  }
}
