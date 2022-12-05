

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numberOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(Icons.remove, () {
          if (numberOfItems > 1) {
            setState(() {
              numberOfItems -= 1;
            });
          }
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text("${numberOfItems}",
              style: Theme.of(context).textTheme.headline6),
        ),
        buildOutlineButton(Icons.add, () {
          setState(() {
            numberOfItems += 1;
          });
        }),
      ],
    );
  }

  SizedBox buildOutlineButton(IconData icon, VoidCallback onPress) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: onPress,
        child: Icon(icon),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            )),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
      ),
    );
  }
}