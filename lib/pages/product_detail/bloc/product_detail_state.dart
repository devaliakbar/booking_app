part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
}

class ProductDetailLoading extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailLoadingFailedState extends ProductDetailState {
  final String errorMsg;
  ProductDetailLoadingFailedState({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class ProductDetailLoadedState extends ProductDetailState {
  final ProductDetailModel productDetailDatas;
  ProductDetailLoadedState({this.productDetailDatas});

  @override
  List<Object> get props => [productDetailDatas];
}
