part of 'cart_bloc_bloc.dart';

@immutable
sealed class CartBlocState {}

abstract class cartActionstate extends CartBlocState {}

final class CartBlocInitial extends CartBlocState {}

class CartsucessState extends CartBlocState {
  final List<prodctdatamodel> cartitems;

  CartsucessState({required this.cartitems});
}
