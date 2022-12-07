import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/models/FakeProduct.dart';
import 'package:shop_app/repositories/fake_product_repository.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {});
    on<GetLimitedEvent>((event, emit) async {
      if (state is! ProductsLoading) {
        emit(ProductsLoading());
        try {
          List<FakeProduct> listProduct = await ProductRepository.instance
              .getLimitedProducts(event.limited);
          emit(ProductsComplete(productsList: listProduct));
        } catch (ex) {
          print(ex.toString());
          emit(ProductsFailure());
        }
      }
    });
    on<GetCategoryAndLimitedEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        List<FakeProduct> listProduct = await ProductRepository.instance
            .getCategoryAndLimitedProducts(event.limited, event.category);
        emit(ProductsComplete(productsList: listProduct));
      } catch (ex) {
        print(ex.toString());
        emit(ProductsFailure());
      }
    });
  }
}
