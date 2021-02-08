import 'package:beers_with_punkapi/bloc/beer/beer_bloc.dart';
import 'package:beers_with_punkapi/bloc/beer/beer_event.dart';
import 'package:beers_with_punkapi/bloc/beer/beer_state.dart';
import 'package:beers_with_punkapi/data/model/api_result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'about_page.dart';
import 'beer_detailed_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BeerBloc beerBloc;

  @override
  void initState() {
    super.initState();
    beerBloc = BlocProvider.of<BeerBloc>(context);
    beerBloc.add(FetchBeersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text('PunkAPI'),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      beerBloc.add(FetchBeersEvent());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      navigateToAboutPage(context);
                    },
                  )
                ],
              ),
              body: Container(
                child: BlocListener<BeerBloc, BeerState>(
                  listener: (context, state) {
                    if (state is BeerErrorState) {
                      // ignore: deprecated_member_use
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                // ignore: missing_required_param
                  child: BlocBuilder<BeerBloc, BeerState>(
                  // ignore: missing_return
                    builder: (context, state) {
                      print(state);
                      if(state is BeerInitialState) {
                        return buildLoading();
                      } else if (state is BeerLoadingState) {
                        return buildLoading();
                      } else if (state is BeerLoadedState) {
                        return buildBeerList(state.beers);
                      } else if (state is BeerErrorState) {
                        return buildErrorUi(state.message);
                      } else {

                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildBeerList(List<Beers> beers) {
    return ListView.builder(
      itemCount: beers.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: ClipOval(
                child: Hero(
                  tag: pos.toString() + "tag",
                  child: Image.network(
                    beers[pos].image_url,
                    fit: BoxFit.cover,
                    width: 70.0,
                    height : 200.0,
                  ),
                ),
              ),
              title: Text(beers[pos].name),
              subtitle: Text(beers[pos].first_brewed),
            ),
            onTap: () {
              navigateToBeerDetailPage(context, beers[pos]);
            },
          ),
        );
      },
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  void navigateToBeerDetailPage(BuildContext context, Beers beer) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BeerDetailPage(
        beers: beer,
      );
    }));
  }

  void navigateToAboutPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AboutPage();
    }));
  }

}