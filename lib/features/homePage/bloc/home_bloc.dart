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
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }
}
