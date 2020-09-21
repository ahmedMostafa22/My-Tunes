import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:task/models/playlist.dart';

class PlaylistsProvider with ChangeNotifier {
  List<PlayList> playlists = [];
  Future fetchPlaylists(String token) async {
    if (playlists.isEmpty) {
      var response, data;
      response = await http.get('https://api.spotify.com/v1/me/playlists',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      data['items'].forEach((playlist) {
        playlists.add(PlayList(
            id: playlist['id'],
            plName: playlist['name'],
            owner: playlist['owner']['display_name'],
            art: playlist['images'][0]['url']));
      });
    }
  }
}
