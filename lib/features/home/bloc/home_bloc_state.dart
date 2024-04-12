part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

abstract class HomeActionstate extends HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeLoading extends HomeBlocState {}

class HomeSucessState extends HomeBlocState {
  final List<prodctdatamodel> products;
  HomeSucessState({required this.products});
}

class HomeErrorStae extends HomeBlocState {}

class NavigatoWishlistpage extends HomeActionstate {}

class NavigateCartpage extends HomeActionstate {}

class HomeporductlisActionstate extends HomeActionstate {}

class HomeporductWishActionstate extends HomeActionstate {}
