import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task/models/song.dart';
import 'package:http/http.dart' as http;

class SongItem extends StatelessWidget {
  final SongModel songItem;
  final String token;
  const SongItem({this.songItem, @required this.token});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Colors.blue[600],
        onTap: () async {
          String body = '{"uris": ["spotify:track:${songItem.id}"]}';
          final res = await http.put(
              'https://api.spotify.com/v1/me/player/play',
              body: body,
              headers: {
                HttpHeaders.authorizationHeader: 'Bearer $token',
                "Content-type": "application/json"
              });
          print(res.body);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          color: Colors.black,
          width: 155,
          height: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 155,
                height: 120,
                color: Colors.black,
                child: GridTile(
                  footer: GridTileBar(
                      leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.black38, shape: BoxShape.circle),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      songItem.art,
                      fit: BoxFit.cover,
                      width: 155,
                      height: 125,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    songItem.name,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    songItem.subtext,
                    maxLines: 1,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
