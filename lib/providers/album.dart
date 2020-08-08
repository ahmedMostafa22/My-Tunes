import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:task/models/Album.dart';

class AlbumsProvider with ChangeNotifier{
  List<Album> categories = [] ; 
  Future<Void> getAlbums(){
    return null; 
  }
}