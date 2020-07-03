part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class ProductLoadEvent extends ProductsEvent {
  final ProductHelper productHelper;
  ProductLoadEvent(this.productHelper);

  @override
  List<Object> get props => [productHelper];
}
