import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/geners.dart';
import 'package:task/widgets/song_tile_item.dart';

class GenreTracks extends StatefulWidget {
  final String genere, token;

  const GenreTracks({Key key, this.genere, this.token}) : super(key: key);
  @override
  _GenreTracksState createState() => _GenreTracksState();
}

class _GenreTracksState extends State<GenreTracks> {
  var _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<GenersProvider>(context, listen: false)
        .fetchGenreTracks(widget.genere, widget.token);
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(widget.genere.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.blue[600], shape: BoxShape.circle),
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView.builder(
                              itemCount: Provider.of<GenersProvider>(context,
                                      listen: false)
                                  .genreSongs
                                  .length,
                              itemBuilder: (context, i) => SongTileItem(token: widget.token,
                                  song: Provider.of<GenersProvider>(context,
                                          listen: false)
                                      .genreSongs[i]))),
                    ],
                  );
              })),
    );
  }
}
