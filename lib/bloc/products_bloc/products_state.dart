part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState { }

class ProductsLoading extends ProductsState { }

class ProductsComplete extends ProductsState {
  final List<FakeProduct> productsList;
  const ProductsComplete({required this.productsList});
  @override
  List<Object> get props => [productsList];
}

class ProductsFailure extends ProductsState { }

