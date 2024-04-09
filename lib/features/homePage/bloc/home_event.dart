part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class CartIconClickedEvent extends HomeEvent{
  final GadgetModel product;

  CartIconClickedEvent({required this.product});
}

