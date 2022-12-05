

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/detail/components/cart_couter.dart';

class CartCounterAndFavBtn extends StatelessWidget {
  const CartCounterAndFavBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartCounter(),
          Container(
            padding: EdgeInsets.all(8),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                color: Color(0xFFFF6464),
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset("assets/icons/heart.svg"),
          )
        ]);
  }
}
