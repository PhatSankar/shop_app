import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/bloc/products_bloc/products_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/components/product_card.dart';

class BuildProductCardList extends StatefulWidget {
  const BuildProductCardList({Key? key}) : super(key: key);

  @override
  State<BuildProductCardList> createState() => _BuildProductCardListState();
}

class _BuildProductCardListState extends State<BuildProductCardList> {
  late ProductsBloc _productsBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _productsBloc = BlocProvider.of(context);
    _productsBloc.add(GetLimitedEvent(6));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      bloc: _productsBloc,
      builder: (context, state) {
        if (state is ProductsFailure)
          {
            return const Text("Fail to get products");
          }
        else
          {
            return GridView.builder(
                itemCount: state is ProductsComplete ? state.productsList.length : 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: kDefaultPaddin,
                    mainAxisSpacing: kDefaultPaddin),
                itemBuilder: (context, index) =>
                    state is ProductsComplete ? ProductCard(state.productsList[index]) : shimmerLoadingProducts()
            );
          }
      },
    );
  }

  Shimmer shimmerLoadingProducts() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!!, highlightColor: Colors.grey[100]!!,
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
