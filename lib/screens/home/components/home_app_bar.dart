import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';

AppBar buildHomeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/back.svg"),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset("assets/icons/search.svg", color: kTextColor,),
      ),
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/cart.svg", color: kTextColor,),
          color: kTextColor),
      SizedBox(width: kDefaultPaddin / 2,)
    ],
  );
}
