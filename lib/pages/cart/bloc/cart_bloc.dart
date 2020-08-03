import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/pages/cart/bloc/data/cart_model.dart';
import 'package:bookingapp/pages/cart/bloc/data/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo cartRepo;
  CartBloc(this.cartRepo);

  @override
  CartState get initialState => CartLoadingState();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartLoadEvent) {
      yield CartLoadingState();

      try {
        CartDatas cartData = await cartRepo.getCartDatas();
        yield CartLoadedState(cartDatas: cartData);
      } catch (e) {
        yield CartLoadingFailedState(errorMsg: e);
      }
    }
  }
}
