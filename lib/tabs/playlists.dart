import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/playlist.dart';
import 'package:task/providers/playlist.dart';
import 'package:task/widgets/playlist_item.dart';

class PlaylistsScreen extends StatefulWidget {
  final String token;

  const PlaylistsScreen({Key key, this.token}) : super(key: key);
  @override
  _PlaylistsScreenState createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  Future _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<PlaylistsProvider>(context, listen: false)
        .fetchPlaylists(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
          future: _future,
          builder: (c, s) {
            if (s.connectionState == ConnectionState.waiting)
              return Center(child:  SpinKitWanderingCubes(
                  itemBuilder: (context, i) {
                    return DecoratedBox(
                        decoration: BoxDecoration(
                      color: Colors.blue[600],
                    ));
                  },
                ),);
            else {
              List<PlayList> playlists =
                  Provider.of<PlaylistsProvider>(context, listen: false).playlists;
              return ListView.builder(
                      itemCount: playlists.length,
                  itemBuilder: (context, i) => PlaylistItem(playlist: playlists[i],token: widget.token,));
            }
          }),
    );
  }
}
