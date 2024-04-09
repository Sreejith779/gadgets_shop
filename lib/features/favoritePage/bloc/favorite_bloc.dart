import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:gadgets_shoop/models/favoriteList.dart';
import 'package:meta/meta.dart';


import '../../../models/gadgetModel.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
on<FavoriteLoadedEvent>(favoriteLoadedEvent);
on<ProductNavigateEvent>(productNavigateEvent);
  }

  FutureOr<void> favoriteLoadedEvent(FavoriteLoadedEvent event, Emitter<FavoriteState> emit) {
  emit(FavoriteLoadedState(favoriteList: favoriteList));
  }

  FutureOr<void> productNavigateEvent(ProductNavigateEvent event, Emitter<FavoriteState> emit) {
    emit(ProductNavigatedActionState());
  }
}
