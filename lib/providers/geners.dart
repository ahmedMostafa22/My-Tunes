import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/song.dart';

class GenersProvider with ChangeNotifier {
  List<String> geners = [];
  List<SongModel> genreSongs = [];
  Future fetchGeners(String token) async {
    if (geners.isEmpty) {
      var response, data;
      response = await http.get(
          'https://api.spotify.com/v1/recommendations/available-genre-seeds',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      data['genres'].forEach((ge) => geners.add(ge));
    }
  }

  Future fetchGenreTracks(String genere, String token) async {
    genreSongs.clear();
    var response, data;
    response = await http.get(
        'https://api.spotify.com/v1/search?q=$genere&type=track&limit=50',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    data = json.decode(response.body);
    if (data != null)
      data['tracks']['items'].forEach((item) {
        genreSongs.add(SongModel(
            id: item['id'],
            name: item['name'],
            subtext: item['album']['artists'][0]['name'],
            art: item['album']['images'][0]['url']));
      });
  }
}
