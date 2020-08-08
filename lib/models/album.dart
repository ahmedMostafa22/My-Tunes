import 'package:flutter/cupertino.dart';

class Album with ChangeNotifier{
  final String art ; 
  final String name ; 
  final String artistName ; 
  final String releaseDate ;

  Album({this.art, this.name, this.artistName, this.releaseDate}); 

}