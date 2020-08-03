import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/pages/product_detail/bloc/data/product_detail_model.dart';
import 'package:bookingapp/pages/product_detail/bloc/data/product_detail_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductDetailRepo productDetailRepo;
  ProductDetailBloc(this.productDetailRepo);

  @override
  ProductDetailState get initialState => ProductDetailLoading();

  @override
  Stream<ProductDetailState> mapEventToState(
    ProductDetailEvent event,
  ) async* {
    if (event is ProductDetailLoadEvent) {
      yield ProductDetailLoading();

      try {
        ProductDetailModel productDetailDatas =
            await productDetailRepo.getProductDetail(event.productId);
        yield ProductDetailLoadedState(productDetailDatas: productDetailDatas);
      } catch (e) {
        print(e);
        yield ProductDetailLoadingFailedState(errorMsg: e.toString());
      }
    }
  }
}
