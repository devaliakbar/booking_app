part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsLoadingState extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoadingFailedState extends ProductsState {
  final String errorMsg;
  ProductsLoadingFailedState({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class ProductsLoadedState extends ProductsState {
  final ProductsDatas productsDatas;
  ProductsLoadedState({this.productsDatas});

  @override
  List<Object> get props => [productsDatas];
}
