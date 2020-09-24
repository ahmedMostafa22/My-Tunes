import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:task/models/song.dart';
import 'package:http/http.dart' as http;

class Album with ChangeNotifier {
  final String art;
  final String name;
  final String artistName;
  final String id;

  List<SongModel> songs = [];
  Album({this.art, this.name, this.artistName, this.id});
  Future fetchTracks(String id, String token, String albumArt) async {
    songs.clear();
    var response, data;
    response = await http.get(
        'https://api.spotify.com/v1/albums/$id/tracks?market=ES',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    data = json.decode(response.body);
    print(data);
    if (data != null)
      data['items'].forEach((item) {
        songs.add(SongModel(
            id: item['id'],
            name: item['name'],
            subtext: item['artists'][0]['name'],
            art: albumArt));
      });
  }
}
