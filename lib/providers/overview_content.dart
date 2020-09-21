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
      for (int i = 0; i < 10; i++) {
        recents.add(SongModel(
            name: data['items'][i]['track']['name'],
            subtext: data['items'][i]['track']['artists'][0]['name'],
            art: data['items'][i]['track']['album']['images'][0]['url']));
      }

      //fetching todays recommendations
      response = await http.get(
          'https://api.spotify.com/v1/recommendations?limit=10&seed_artists=4NHQUGzhtTLFvgF5SZesLK&seed_tracks=0c6xIDDpzE81m2q797ordA&min_energy=0.4&min_popularity=50&market=US',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      for (int i = 0; i < 10; i++) {
        todayRecom.add(SongModel(
            name: data['tracks'][i]['name'].toString(),
            subtext:
                data['tracks'][i]['album']['artists'][0]['name'].toString(),
            art: data['tracks'][i]['album']['images'][0]['url']));
      }

      //fetching legacy tracks
      response = await http.get(
          'https://api.spotify.com/v1/search?q=year%3A2020&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      for (int i = 0; i < 10; i++) {
        newReleases.add(SongModel(
            name: data['tracks']['items'][i]['album']['name'].toString(),
            subtext: data['tracks']['items'][i]['album']['artists'][0]['name']
                .toString(),
            art: data['tracks']['items'][i]['album']['images'][0]['url']));
      }

      //fetching user top tracks
      response = await http.get(
          'https://api.spotify.com/v1/me/top/tracks?limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      for (int i = 0; i < 10; i++) {
        topTracks.add(SongModel(
            name: data['items'][i]['name'],
            subtext: data['items'][i]['artists'][0]['name'],
            art: data['items'][i]['album']['images'][0]['url']));
      }
      //fetching legacy
      response = await http.get(
          'https://api.spotify.com/v1/search?q=year%3A2010-2015&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      for (int i = 0; i < 10; i++) {
        legacy.add(SongModel(
            name: data['tracks']['items'][i]['album']['name'].toString(),
            subtext: data['tracks']['items'][i]['album']['artists'][0]['name']
                .toString(),
            art: data['tracks']['items'][i]['album']['images'][0]['url']));
      }
      //fetching oldSchool
      response = await http.get(
          'https://api.spotify.com/v1/search?q=year%3A1995-2000&type=track&limit=10',
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      data = json.decode(response.body);
      for (int i = 0; i < 10; i++) {
        oldSchool.add(SongModel(
            name: data['tracks']['items'][i]['album']['name'].toString(),
            subtext: data['tracks']['items'][i]['album']['artists'][0]['name']
                .toString(),
            art: data['tracks']['items'][i]['album']['images'][0]['url']));
      }
    }
  }
}
