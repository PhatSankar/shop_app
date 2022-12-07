import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/bloc/products_bloc/products_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FakeProduct.dart';
import 'package:shop_app/repositories/fake_product_repository.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing",
  ];

  late ProductsBloc _productsBloc;
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _productsBloc = BlocProvider.of(context);
    _productsBloc.add(GetCategoryAndLimitedEvent(6, categories[0].toLowerCase()));
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => buildCategory(index)),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        _productsBloc.add(GetCategoryAndLimitedEvent(6, categories[index].toLowerCase()));

        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: index == selectedIndex ? kTextColor : kTextLightColor),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: index == selectedIndex ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
