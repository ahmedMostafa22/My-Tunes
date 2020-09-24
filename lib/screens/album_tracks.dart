import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/album.dart';
import 'package:task/widgets/song_tile_item.dart';

class AlbumTracks extends StatefulWidget {
  final String albumId, albumName, albumImage, token;

  const AlbumTracks(
      {Key key, this.albumId, this.albumName, this.albumImage, this.token})
      : super(key: key);

  @override
  _AlbumTracksState createState() => _AlbumTracksState();
}

class _AlbumTracksState extends State<AlbumTracks> {
  var _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<Album>(context, listen: false)
        .fetchTracks(widget.albumId, widget.token, widget.albumImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return SpinKitWanderingCubes(
              itemBuilder: (context, i) {
                return DecoratedBox(
                    decoration: BoxDecoration(
                  color: Colors.blue[600],
                ));
              },
            );
          else
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.albumImage),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.15), BlendMode.dstATop),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.albumName,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                          itemCount: Provider.of<Album>(context, listen: false)
                              .songs
                              .length,
                          itemBuilder: (context, i) => SongTileItem(token: widget.token,
                              song: Provider.of<Album>(context, listen: false)
                                  .songs[i],
                              albumArt: widget.albumImage))),
                ],
              ),
            );
        },
      )),
    );
  }
}
