import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:task/models/song.dart';

class PlaylistsProvider with ChangeNotifier{
  List<SongModel> playlist = [] ; 
  Future<Void> getPlaylist(){
    return null; 
  }
}