import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:task/models/song.dart';
import 'package:http/http.dart' as http;

class Artist with ChangeNotifier {
  final String name;
  final String followers;
  final String id;
  final String image;

  List<SongModel> songs = [];
  Artist({this.name, this.followers, this.id, this.image});

  Future fetchTracks(String id, String token) async {
    songs.clear();
    var response, data;
    response = await http.get(
        'https://api.spotify.com/v1/artists/$id/top-tracks?country=ES',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    data = json.decode(response.body);
    if (data != null)
      data['tracks'].forEach((item) {
        songs.add(SongModel(
            id: item['id'],
            name: item['name'],
            subtext: item['album']['name'],
            art: item['album']['images'][0]['url']));
      });
  }
}
