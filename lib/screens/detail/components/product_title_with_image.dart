import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';

class ProductTitleWithImage extends StatelessWidget {
  FakeProduct product;

  ProductTitleWithImage(FakeProduct this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(product.title!!,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          maxLines: 2,
          minFontSize: 12,),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPaddin),
            child: Row(
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ])),
                SizedBox(width: kDefaultPaddin,),
                Expanded(child: Hero(
                  tag: "${product.id}",
                  child: Image.network(product.image!!,
                    height: size.height / 4,),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
