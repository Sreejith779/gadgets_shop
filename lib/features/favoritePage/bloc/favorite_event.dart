part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteLoadedEvent extends FavoriteEvent{}

class ProductNavigateEvent extends FavoriteEvent{
  final GadgetModel product;

  ProductNavigateEvent({required this.product});
}

class ProductDeleteEvent extends FavoriteEvent{
  final GadgetModel deleteProduct;

  ProductDeleteEvent({required this.deleteProduct});
}
