part of 'home_bloc.dart';

@immutable
 abstract class HomeState {}
 abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState{

  final List<GadgetModel>model = electronicGadgets.map((e)
  => GadgetModel(category: e['category'], name: e['name'], price: e['price'], image: e['image'],
      rating: e['rating'], likesPercentage: e['likesPercentage'],
      numberOfReviews: e['numberOfReviews'], description: e['description'])).toList();

}


class SearchLoadedState extends HomeState{
  final List words;

  SearchLoadedState({required this.words});

  final List<GadgetModel>model = electronicGadgets.map((e)
  => GadgetModel(category: e['category'], name: e['name'], price: e['price'], image: e['image'],
      rating: e['rating'], likesPercentage: e['likesPercentage'],
      numberOfReviews: e['numberOfReviews'], description: e['description'])).toList();
}
