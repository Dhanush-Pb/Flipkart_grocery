import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/cartitems.dart';
import 'package:bloc_app/data/grocery_data.dart';
import 'package:bloc_app/data/wishlistitems.dart';
import 'package:bloc_app/features/home/models/home_pr_model.dart';

import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeinitialEvent>(homeinitialEvent);
    on<Homeproductishlistbuttenclickevent>(homeproductishlistbuttenclickevent);
    on<HomeproductCarttbuttenclickevent>(homeproductCarttbuttenclickevent);
    on<HometWishtButtenNavigte>(hometWishtButtenNavigte);
    on<HomecarttButtenNavigte>(homecarttButtenNavigte);
  }
  Future<void> homeinitialEvent(
      HomeinitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeSucessState(
        products: Grocerydata.groceryProducts
            .map((e) => prodctdatamodel(
                name: e['name'],
                id: e['id'],
                description: e['description'],
                price: e['price'],
                imageurl: e['imageUrl'])) // corrected key 'imageUrl'
            .toList()));
  }

  FutureOr<void> homeproductishlistbuttenclickevent(
      Homeproductishlistbuttenclickevent event, Emitter<HomeBlocState> emit) {
    print('wish aded');
    wishlist.add(event.clickproduct);
    emit(HomeporductWishActionstate());
  }

  FutureOr<void> homeproductCarttbuttenclickevent(
      HomeproductCarttbuttenclickevent event, Emitter<HomeBlocState> emit) {
    print('cart added');
    cartitems.add(event.clickproduct);
    emit(HomeporductlisActionstate());
  }

  FutureOr<void> hometWishtButtenNavigte(
      HometWishtButtenNavigte event, Emitter<HomeBlocState> emit) {
    emit(NavigatoWishlistpage());
    print('wishlist clicked');
  }

  FutureOr<void> homecarttButtenNavigte(
      HomecarttButtenNavigte event, Emitter<HomeBlocState> emit) {
    emit(NavigateCartpage());
    print('cartbuttn cliked');
  }
}
