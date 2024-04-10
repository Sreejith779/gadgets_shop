part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{
}

class IncrementEvent extends CartEvent{

  final int count;

  IncrementEvent({required this.count});

}
class DecrementEvent extends CartEvent{
  final  GadgetModel item;
  final int count;
  DecrementEvent({required this.item,required this.count});
}

class ItemRemoveEvent extends CartEvent{
  final GadgetModel removeItem;


  ItemRemoveEvent({required this.removeItem});
}
