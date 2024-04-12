part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeinitialEvent extends HomeBlocEvent {}

class Homeproductishlistbuttenclickevent extends HomeBlocEvent {
  final prodctdatamodel clickproduct;

  Homeproductishlistbuttenclickevent({required this.clickproduct});
}

class HomeproductCarttbuttenclickevent extends HomeBlocEvent {
  final prodctdatamodel clickproduct;

  HomeproductCarttbuttenclickevent({required this.clickproduct});
}

class HometWishtButtenNavigte extends HomeBlocEvent {}

class HomecarttButtenNavigte extends HomeBlocEvent {}
