part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocEvent {}

class Cartinitialevent extends CartBlocEvent {}

class CartRemove extends CartBlocEvent {
  final prodctdatamodel prductdatemode;

  CartRemove({required this.prductdatemode});
}
