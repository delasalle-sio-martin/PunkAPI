import 'package:flutter/material.dart';

class ApiResultModel {
  String status;
  int totalResults;
  List<Beers> beers;

  ApiResultModel({this.status, this.totalResults, this.beers});

  ApiResultModel.fromJson(List json) {
    //status = json[status];
    //totalResults = json[totalResults];
    //if(json['beers'] != null) {
      beers = new List<Beers>();
      json.forEach((v) {
        beers.add(new Beers.fromJson(v));
      });
    }

/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if(this.beers != null) {
      data['beers'] = this.beers.map((v) => v.toJson()).toList();
    }
    return data;
  }*/
}


class Beers {
  int id;
  String name;
  String first_brewed;
  String description;
  String image_url;
  double abv;
  double ibu;


  Beers(
  {
    this.id,
    this.name,
    this.first_brewed,
    this.description,
    this.image_url,
    this.abv,
    this.ibu });

  Beers.fromJson(Map<String, dynamic> json) {


    id = json['id'];
    name = json['name'];
    first_brewed = json['first_brewed'];
    description = json['description'];
    image_url = json['image_url'];
    //abv = json['abv'] is int ? (json[abv] as int).toDouble() : json['abv'];
    //ibu = json['ibu'] is int ? (json[ibu] as int).toDouble() : json['ibu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_brewed'] = this.first_brewed;
    data['description'] = this.description;
    data['image_url'] = this.image_url;
    data['abv'] = this.abv;
    data['ibu'] = this.ibu;
    return data;
  }

}