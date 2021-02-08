import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:beers_with_punkapi/data/model/api_result_model.dart';
import 'package:beers_with_punkapi/res/strings/strings.dart';

abstract class BeerRepository {
  Future<List<Beers>> getBeers();
}

class BeerRepositoryImpl implements BeerRepository {

  @override
  Future<List<Beers>> getBeers() async {
    var response = await http.get(AppStrings.beerUrl);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      List<Beers> beers = ApiResultModel.fromJson(data).beers;
      return beers;
    } else {
      throw Exception();
    }
  }
}