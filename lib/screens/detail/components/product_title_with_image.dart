import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  Product product;

  ProductTitleWithImage(Product this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name product",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(product.title!!,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "price\n"),
                TextSpan(
                    text: "\$${product.price}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ])),
              SizedBox(width: kDefaultPaddin,),
              Expanded(child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image!!,
                  fit: BoxFit.fitWidth,),
              ))
            ],
          )
        ],
      ),
    );
  }
}
