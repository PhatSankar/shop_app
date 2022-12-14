import 'package:flutter/material.dart';
import 'package:shop_app/bloc/products_bloc/products_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/components/buildListProductCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Women",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Categories(),
          const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: BuildProductCardList(),
              )),
        ],
      ),
    );
  }
}
