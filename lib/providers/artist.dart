import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/artist.dart';
import 'dart:convert';
import 'dart:io';
class ArtistsProvider with ChangeNotifier {
  List<Artist> artists = [];
  Future fetchArtists(String token) async {
    if (artists.isEmpty) {
      var response, data;
      response = await http.get('https://api.spotify.com/v1/me/following?type=artist',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      data['artists']['items'].forEach((artist) {
        artists.add(Artist(
          followers: artist['followers']['total'].toString(),
          id: artist['id'],
          image: artist['images'][0]['url'],
          name: artist['name']
        ));
      });
    }
}
}
