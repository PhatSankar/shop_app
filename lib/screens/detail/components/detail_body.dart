import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/detail/components/add_to_cart_and_buy_now.dart';
import 'package:shop_app/screens/detail/components/cart_couter.dart';
import 'package:shop_app/screens/detail/components/color_and_size.dart';
import 'package:shop_app/screens/detail/components/product_description.dart';
import 'package:shop_app/screens/detail/components/product_title_with_image.dart';

import 'cart_counter_and_fav_btn.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  DetailBody(Product this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.33),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      ColorAndSize(product),
                      SizedBox(height: kDefaultPaddin / 2,),
                      ProductDescription(product),
                      SizedBox(height: kDefaultPaddin / 2,),
                      CartCounterAndFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2,),
                      AddToCartAndBuyNow(product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
