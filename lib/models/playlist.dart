import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:task/models/song.dart';
import 'package:http/http.dart' as http;

class PlayList with ChangeNotifier {
  final id, art, owner, plName;
  List<SongModel> songs = [];
  PlayList({this.id, this.art, this.owner, this.plName});

  Future fetchTracks(String id, String token) async {
    songs.clear();
    var response, data;
    response = await http.get('https://api.spotify.com/v1/playlists/$id/tracks',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    data = json.decode(response.body);
    if (data != null)
      data['items'].forEach((item) {
        songs.add(SongModel(
            id: item['track']['id'],
            name: item['track']['name'],
            subtext: item['track']['artists'][0]['name'],
            art: item['track']['album']['images'][0]['url']));
      });
  }
}
