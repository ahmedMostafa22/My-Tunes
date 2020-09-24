import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/album.dart';
import 'package:task/providers/album.dart';
import 'package:task/widgets/playlist_item.dart';

class AlbumsScreen extends StatefulWidget {
  final String token;

  const AlbumsScreen({Key key, this.token}) : super(key: key);
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  Future _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<AlbumsProvider>(context, listen: false)
        .fetchAlbums(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future: _future,
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting)
              return Center(
                child: SpinKitWanderingCubes(
                  itemBuilder: (context, i) {
                    return DecoratedBox(
                        decoration: BoxDecoration(
                      color: Colors.blue[600],
                    ));
                  },
                ),
              );
            else {
              List<Album> albums =
                  Provider.of<AlbumsProvider>(context, listen: false).albums;
              return ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: (context, i) => PlaylistItem(album: albums[i],token: widget.token,));
            }
          }),
    );
  }
}
