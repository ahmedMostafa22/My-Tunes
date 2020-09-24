import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/playlist.dart';
import 'package:task/widgets/song_tile_item.dart';

class TracksList extends StatefulWidget {
  final String playListId, token, name, art;

  const TracksList({Key key, this.playListId, this.token, this.name, this.art})
      : super(key: key);
  @override
  _TracksListState createState() => _TracksListState();
}

class _TracksListState extends State<TracksList> {
  var _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<PlayList>(context, listen: false)
        .fetchTracks(widget.playListId, widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: FutureBuilder(
              future: _future,
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting)
                  return SpinKitWanderingCubes(
                    itemBuilder: (context, i) {
                      return DecoratedBox(
                          decoration: BoxDecoration(
                        color: Colors.blue[600],
                      ));
                    },
                  );
                else {
                  String tracks = '';
                  Provider.of<PlayList>(context).songs.forEach((element) {
                    tracks += '"spotify:track:${element.id}",';
                  });
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.art),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.15), BlendMode.dstATop),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.name,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                        InkWell(
                          onTap: () async {
                            String body = '{"uris": [${tracks.substring(0,tracks.length-1)}]}';
                            final res = await http.put(
                                'https://api.spotify.com/v1/me/player/play',
                                body: body,
                                headers: {
                                  HttpHeaders.authorizationHeader:
                                      'Bearer ${widget.token}',
                                  "Content-type": "application/json"
                                });
                            print(res.body);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.blue[600],
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.play_arrow,
                              size: 40,
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                                itemCount: Provider.of<PlayList>(context,
                                        listen: false)
                                    .songs
                                    .length,
                                itemBuilder: (context, i) => SongTileItem(
                                    token: widget.token,
                                    song: Provider.of<PlayList>(context,
                                            listen: false)
                                        .songs[i]))),
                      ],
                    ),
                  );
                }
              }),
        ));
  }
}
