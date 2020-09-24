import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task/models/song.dart';

class SongTileItem extends StatelessWidget {
  final SongModel song;
  final String albumArt;
  final String token; 
  const SongTileItem({Key key, this.song, this.albumArt,@required this.token}) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String body = '{"uris": ["spotify:track:${song.id}"]}';
        await http.put('https://api.spotify.com/v1/me/player/play',
            body: body,
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $token',
              "Content-type": "application/json"
            });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        color: Colors.transparent,
        child: ListTile(
          leading: Image.network(song.art ?? albumArt),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                song.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(song.subtext)
            ],
          ),
        ),
      ),
    );
  }
}
