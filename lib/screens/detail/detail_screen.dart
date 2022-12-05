import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/detail/components/detail_body.dart';

class DetailScreen extends StatelessWidget {
  Product product;

  DetailScreen(Product this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildDetailAppBar(product, context),
      body: DetailBody(product),
    );
  }

  AppBar buildDetailAppBar(Product product, BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: product.color,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/search.svg')),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset('assets/icons/cart.svg')),
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
