part of 'cart_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState extends CartState{}

class CartInitial extends CartState {}

class CartLoadedState extends CartState{
  final List<GadgetModel> cartList = cartItems;
  int count = 1;
}
class IncrementActionState extends CartActionState{}
class DecrementActionStates extends CartActionState{
}