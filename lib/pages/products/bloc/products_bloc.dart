import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/pages/products/bloc/data/products_model.dart';
import 'package:bookingapp/pages/products/bloc/data/products_repo.dart';
import 'package:bookingapp/pages/products/product_helper.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo);

  @override
  ProductsState get initialState => ProductsLoadingState();

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is ProductLoadEvent) {
      yield ProductsLoadingState();

      try {
        ProductsDatas productsDatas =
            await productsRepo.getProducts(event.productHelper);
        yield ProductsLoadedState(productsDatas: productsDatas);
      } catch (e) {
        yield ProductsLoadingFailedState(errorMsg: e);
      }
    }
  }
}
