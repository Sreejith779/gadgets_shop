import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gadgets_shoop/models/cartList.dart';
import 'package:gadgets_shoop/models/gadgetsList.dart';
import 'package:meta/meta.dart';

import '../../../models/gadgetModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<CartIconClickedEvent>(cartIconClickedEvent);
    on<CartNavigateEvent>(cartNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }

  FutureOr<void> cartIconClickedEvent(
      CartIconClickedEvent event, Emitter<HomeState> emit) {
    print("Product clicked");
    cartItems.add(event.product);
    emit(CartIconClickedActionState());
    emit(HomeLoadedState());
  }

  FutureOr<void> cartNavigateEvent(CartNavigateEvent event, Emitter<HomeState> emit) {
    emit(CartNavigateActionState());
  }
}
