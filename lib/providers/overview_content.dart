import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:task/models/song.dart';

class OverviewProvider with ChangeNotifier {
  List<SongModel> recents = [];
  List<SongModel> todayRecom = [];
  List<SongModel> newReleases = [];
  List<SongModel> topTracks = [];
  List<SongModel> legacy = [];
  List<SongModel> oldSchool = [];

  Future<void> fetchOverview(String token) async {
    var data;
    Response response;
    //fetching recently played tracks
    if (recents.isEmpty) {
      response = await http.get(
          'https://api.spotify.com/v1/me/player/recently-played?type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      if (data != null)
        data['items'].forEach((track) {
          recents.add(SongModel(
              id: track['track']['id'],
              name: track['track']['name'],
              subtext: track['track']['artists'][0]['name'],
              art: track['track']['album']['images'][0]['url']));
        });

      //fetching todays recommendations
      response = await http.get(
          'https://api.spotify.com/v1/recommendations?limit=10&seed_artists=4NHQUGzhtTLFvgF5SZesLK&seed_tracks=0c6xIDDpzE81m2q797ordA&min_energy=0.4&min_popularity=50&market=US',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      if (data != null)
        data['tracks'].forEach((track) {
          todayRecom.add(SongModel(
              id: track['id'],
              name: track['name'],
              subtext: track['album']['artists'][0]['name'],
              art: track['album']['images'][0]['url']));
        });

      //fetching new releases
      response = await http.get(
          'https://api.spotify.com/v1/search?q=new&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      if (data != null)
        data['tracks']['items'].forEach((item) {
          newReleases.add(SongModel(
              name: item['name'],
              id: item['id'],
              subtext: item['album']['artists'][0]['name'],
              art: item['album']['images'][0]['url']));
        });

      //fetching user top tracks
      response = await http.get(
          'https://api.spotify.com/v1/me/top/tracks?limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      if (data != null)
        data['items'].forEach((item) {
          topTracks.add(SongModel(
              id: item['id'],
              name: item['name'],
              subtext: item['artists'][0]['name'],
              art: item['album']['images'][0]['url']));
        });

      //fetching legacy
      response = await http.get(
          'https://api.spotify.com/v1/search?q=year%3A2010-2015&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      if (data != null)
        data['tracks']['items'].forEach((item) {
          legacy.add(SongModel(
              name: item['name'],
              id: item['id'],
              subtext: item['album']['artists'][0]['name'],
              art: item['album']['images'][0]['url']));
        });

      //fetching oldSchool
      response = await http.get(
          'https://api.spotify.com/v1/search?q=year%3A1995-2000&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      if (data != null)
        data['tracks']['items'].forEach((item) {
          oldSchool.add(SongModel(
              name: item['name'],
              id: item['id'],
              subtext: item['album']['artists'][0]['name'],
              art: item['album']['images'][0]['url']));
        });
    }
  }
}
