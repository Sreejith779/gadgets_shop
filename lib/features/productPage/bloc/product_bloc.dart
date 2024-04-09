import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gadgets_shoop/models/favoriteList.dart';
import 'package:gadgets_shoop/models/gadgetModel.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
 on<FavoriteButtonClickedEvent>(favoriteButtonClickedEvent);
 on<FavoriteButtonRemoveEvent>(favoriteButtonRemoveEvent);
 
  }

  FutureOr<void> favoriteButtonClickedEvent(FavoriteButtonClickedEvent event, Emitter<ProductState> emit) {
print("Item Added${event.clickedProduct.name}");

favoriteList.add(event.clickedProduct);
emit(FavoriteButtonClickedActionState());
  }

  FutureOr<void> favoriteButtonRemoveEvent(FavoriteButtonRemoveEvent event, Emitter<ProductState> emit) {
    print("Item removed");
    favoriteList.remove(event.clickedProduct);
    emit(FavoriteButtonRemoveActionState());
  }
}
