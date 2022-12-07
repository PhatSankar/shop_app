part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class GetLimitedEvent extends ProductsEvent {
  final int limited;
  const GetLimitedEvent(this.limited);
  @override
  // TODO: implement props
  List<Object?> get props => [limited];

}

class GetCategoryAndLimitedEvent extends ProductsEvent {
  final int limited;
  final String category;
  const GetCategoryAndLimitedEvent(this.limited, this.category);
  @override
  // TODO: implement props
  List<Object?> get props => [limited, category];

}
