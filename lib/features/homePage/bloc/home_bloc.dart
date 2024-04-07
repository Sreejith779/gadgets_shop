import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gadgets_shoop/models/gadgetsList.dart';
import 'package:meta/meta.dart';

import '../../../models/gadgetModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<SearchTextChangedEvent>(searchTextChangedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }





  FutureOr<void> searchTextChangedEvent(SearchTextChangedEvent event, Emitter<HomeState> emit) {

    if(event.searchTextChanged.isEmpty){
    emit(SearchLoadedState(words: model));
    }else{
   filteredList = model.where((element) => element.name.toLowerCase().
   contains(event.searchTextChanged.toLowerCase())).toList();

   emit(SearchLoadedState(words: filteredList));

    }
  }
}

final List<GadgetModel>model = electronicGadgets.map((e)
=> GadgetModel(category: e['category'], name: e['name'], price: e['price'], image: e['image'],
    rating: e['rating'], likesPercentage: e['likesPercentage'],
    numberOfReviews: e['numberOfReviews'], description: e['description'])).toList();


 List<GadgetModel>filteredList=[];