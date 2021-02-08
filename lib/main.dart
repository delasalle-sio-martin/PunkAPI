import 'package:beers_with_punkapi/bloc/beer/beer_bloc.dart';
import 'package:beers_with_punkapi/data/repository/beer_repository.dart';
import 'package:beers_with_punkapi/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PunkAPI',
      home: BlocProvider(
        create: (context) => BeerBloc(repository: BeerRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}