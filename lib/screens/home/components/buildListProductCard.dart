import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/product_card.dart';

class BuildProductCardList extends StatefulWidget {
  const BuildProductCardList({Key? key}) : super(key: key);

  @override
  State<BuildProductCardList> createState() => _BuildProductCardListState();
}

class _BuildProductCardListState extends State<BuildProductCardList> {

  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10000), () {
      setState(() {
        isLoaded = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: kDefaultPaddin,
            mainAxisSpacing: kDefaultPaddin),
        itemBuilder: (context, index) =>
            isLoaded ? ProductCard(products[index]) : shimmerLoadingProducts());
  }

  Shimmer shimmerLoadingProducts() {
    return Shimmer.fromColors(baseColor: Colors.grey[300]!!, highlightColor: Colors.grey[100]!!,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(color: Colors.white,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Container(color: Colors.white),
            ),
            Container(color: Colors.white),
          ],
        ));
  }
}
