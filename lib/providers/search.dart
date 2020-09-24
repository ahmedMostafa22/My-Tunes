import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/song.dart';

class SearchProvider with ChangeNotifier {
  List<SongModel> tracksSearchResult = [];
  bool fetching = false;

  Future fetchSearchResult(String token, String searchString) async {
    tracksSearchResult.clear();
    if (searchString.trim() != "" && !fetching) {
      fetching = true;
      var response, data;
      response = await http.get(
          'https://api.spotify.com/v1/search?q=$searchString&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      data['tracks']['items'].forEach((item) {
        tracksSearchResult.add(SongModel(
            name: item['name'],
            id: item['id'],
            subtext: item['album']['artists'][0]['name'],
            art: item['album']['images'][0]['url']));
      });
      fetching = false;
    }
  }
}
