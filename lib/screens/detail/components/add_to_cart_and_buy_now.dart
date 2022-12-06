import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartAndBuyNow extends StatelessWidget {
  final FakeProduct product;
  const AddToCartAndBuyNow(FakeProduct this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPaddin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                // border: Border.all(color: product.color!!)
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                // color: product.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(product.color!!),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                  ))
              ),
              onPressed: () {},
              child: Text(
                "Buy now".toUpperCase(),
                style: TextStyle(fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
