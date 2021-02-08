import 'package:beers_with_punkapi/data/model/api_result_model.dart';
import 'package:flutter/material.dart';

class BeerDetailPage extends StatelessWidget {
  Beers beers;

  BeerDetailPage({this.beers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beers'),
      ),
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              beers.name,
              style: TextStyle(fontSize: 40.0, color: Colors.red),
            ),
          ),
          Hero(
            tag: beers.image_url,
            child: Image.network(beers.image_url),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Text(
              beers.first_brewed,
              style: TextStyle(fontSize: 25.0, color: Colors.amber),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.all(10.0),
          //   child: Text('abv : ' + beers.abv.toString()),
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   margin: EdgeInsets.all(10.0),
          //   child: Text('ibu : ' + beers.ibu.toString()),
          // ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            child: Text(beers.description),
          ),
        ],
      ),
    );
  }

}