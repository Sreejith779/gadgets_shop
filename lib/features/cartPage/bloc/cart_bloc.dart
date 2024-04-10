import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gadgets_shoop/models/cartList.dart';
import 'package:gadgets_shoop/models/gadgetModel.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
 on<CartInitialEvent>(cartInitialEvent);
 on<DecrementEvent>(decrementEvent);
 on<IncrementEvent>(incrementEvent);
 on<ItemRemoveEvent>(itemRemoveEvent);


  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadedState());
  }


  FutureOr<void> decrementEvent(DecrementEvent event, Emitter<CartState> emit) {
    int decrementCount = event.count;
    if(decrementCount==1){
      cartItems.remove(event.item);
    }
    emit(CartLoadedState());
    print("$decrementCount");
  }

  FutureOr<void> incrementEvent(IncrementEvent event, Emitter<CartState> emit) {
    int currentCounts = event.count;
    if(currentCounts>=1){
      currentCounts++;
    }

print("incremented $currentCounts");
emit(IncrementActionState());
emit(CartLoadedState());

  }

  FutureOr<void> itemRemoveEvent(ItemRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removeItem);
    emit(CartLoadedState());
  }



}
