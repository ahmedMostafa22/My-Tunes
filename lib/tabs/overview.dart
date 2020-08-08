import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/widgets/song_item.dart';
import 'package:task/models/song.dart';

class Overview extends StatefulWidget {
  final String token;

  const Overview({Key key, this.token}) : super(key: key);
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List<SongModel> tracks = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: http.get(
            'https://api.spotify.com/v1/me/player/recently-played?type=track&limit=5',
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer ${widget.token}'
            }),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting ||
              s.data.body == null)
            return Center(
              child: LinearProgressIndicator(),
            );
          else {
            tracks.clear();
            Map<String, dynamic> data = json.decode(s.data.body);
            for (int i = 0; i < 5; i++)
              tracks.add(SongModel(
                  name: data['items'][i]['track']['name'].toString(),
                  date: data['items'][i]['played_at'].toString(),
                  art: data['items'][i]['track']['album']['images'][0]['url']));
            return Container(
                color: Colors.black,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recently Played',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      width: width,
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, i) => SongItem(
                                songItem: SongModel(
                                    date: tracks[i].date,
                                    art: tracks[i].art,
                                    name: tracks[i].name),
                              )),
                    )
                  ],
                ));
          }
        });
  }
}
//secret c0b45fdc225442b28ce0e865bf81ca73
// client id db50989a20a246a2b4d946e6fe922869
// redircet url spotify-sdk://auth
