part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}
abstract class FavoriteActionState extends FavoriteState {}

 class FavoriteInitial extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState{

 final List<GadgetModel> favoriteList;

  FavoriteLoadedState({required this.favoriteList});
}

class ProductNavigatedActionState extends FavoriteActionState{}
