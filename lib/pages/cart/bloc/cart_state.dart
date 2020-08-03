part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadingFailedState extends CartState {
  final String errorMsg;
  CartLoadingFailedState({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class CartLoadedState extends CartState {
  final CartDatas cartDatas;
  CartLoadedState({this.cartDatas});

  @override
  List<Object> get props => [cartDatas];
}
