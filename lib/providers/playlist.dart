import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:task/models/playlist.dart';

class PlaylistsProvider with ChangeNotifier{
  List<PlaylistModel> playlist = [] ; 
  Future<Void> getPlaylist(){
    return null; 
  }
}