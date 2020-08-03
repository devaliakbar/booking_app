part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

class ProductDetailLoadEvent extends ProductDetailEvent {
  final String productId;
  ProductDetailLoadEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
