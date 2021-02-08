import 'package:beers_with_punkapi/data/model/api_result_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class BeerState extends Equatable {}

class BeerInitialState extends BeerState {
  @override
  List<Object> get props => [];
}

class BeerLoadingState extends BeerState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class BeerLoadedState extends BeerState {
  List<Beers> beers;
  BeerLoadedState({@required this.beers});

  @override
  List<Object> get props => [beers];
}

// ignore: must_be_immutable
class BeerErrorState extends BeerState {
  String message;
  BeerErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}