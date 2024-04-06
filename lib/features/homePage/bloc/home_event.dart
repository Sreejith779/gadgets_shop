part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class SearchEvent extends HomeEvent{

  final String word;

  SearchEvent({required this.word});

}