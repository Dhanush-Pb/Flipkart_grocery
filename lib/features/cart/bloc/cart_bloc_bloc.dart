import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cartitems.dart';
import 'package:bloc_app/features/home/models/home_pr_model.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<Cartinitialevent>(cartinitialevent);

    on<CartRemove>(cartRemove);
  }

  FutureOr<void> cartinitialevent(
      Cartinitialevent event, Emitter<CartBlocState> emit) {
    emit(CartsucessState(cartitems: cartitems));
  }

  FutureOr<void> cartRemove(CartRemove event, Emitter<CartBlocState> emit) {
    cartitems.remove(event.prductdatemode);
    emit(CartsucessState(cartitems: cartitems));
  }
}
