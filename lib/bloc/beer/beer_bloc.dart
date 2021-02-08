import 'package:beers_with_punkapi/bloc/beer/beer_event.dart';
import 'package:beers_with_punkapi/bloc/beer/beer_state.dart';
import 'package:beers_with_punkapi/data/model/api_result_model.dart';
import 'package:beers_with_punkapi/data/repository/beer_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {

  BeerRepository repository;

  BeerBloc({@required this.repository}) : super(null);

  BeerState get initialState => BeerInitialState();

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if(event is FetchBeersEvent) {
      yield BeerLoadingState();
      try {
        List<Beers> beers = await repository.getBeers();
        yield BeerLoadedState(beers: beers);
      } catch (e) {
        yield BeerErrorState(message: e.toString());
      }
    }
  }
}