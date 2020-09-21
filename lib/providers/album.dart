import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/album.dart';

class AlbumsProvider with ChangeNotifier {
  List<Album> albums = [];
  Future fetchAlbums(String token) async {
    if (albums.isEmpty) {
      var response, data;
      response = await http.get('https://api.spotify.com/v1/me/albums',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      data['items'].forEach((album) {
        albums.add(Album(
            name: album['album']['name'],
            art: album['album']['images'][0]['url'],
            artistName: album['album']['artists'][0]['name'],
            id: album['album']['id']));
      });
    }
  }
}
