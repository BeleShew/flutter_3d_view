import 'package:flutter/material.dart';

class Product{
  int? id;
  String? name ;
  String? category ;
  List<String>? imageList;
  List<Color>? colorList;
  double? price ;
  bool? isliked ;
  bool? isSelected ;
  Product({this.id,this.name, this.category, this.price, this.isliked,this.isSelected = false,this.colorList, this.imageList,});
}