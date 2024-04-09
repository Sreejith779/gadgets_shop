part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FavoriteButtonClickedEvent extends ProductEvent{

  final GadgetModel clickedProduct;

  FavoriteButtonClickedEvent({required this.clickedProduct});
}

class FavoriteButtonRemoveEvent extends ProductEvent{
  final GadgetModel clickedProduct;

  FavoriteButtonRemoveEvent({required this.clickedProduct});
}
