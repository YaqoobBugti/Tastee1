// import 'package:flutter/material.dart';

List<ListWords>  listWords = [
  ListWords('Pasta Cheese', 'Container'),
  
];

class ListWords {
  String titlelist;
  String definitionlist;

  ListWords(String titlelist, String definitionlist) {
    this.titlelist = titlelist;
    this.definitionlist = definitionlist;
  }
}