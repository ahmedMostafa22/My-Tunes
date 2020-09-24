import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/artist.dart';
import 'package:task/widgets/song_tile_item.dart';

class ArtistTracks extends StatefulWidget {
  final String artistId , artistName ,artistImage , token ;

  const ArtistTracks({Key key, this.artistId, this.artistName, this.token, this.artistImage}) : super(key: key); 
  @override
  _ArtistTracksState createState() => _ArtistTracksState();
}

class _ArtistTracksState extends State<ArtistTracks> {
  var _future; 
  @override
  void initState() {
    super.initState();
    _future = Provider.of<Artist>(context,listen: false).fetchTracks(widget.artistId, widget.token); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
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
                      CircleAvatar(backgroundImage:NetworkImage(widget.artistImage),radius: 50,),
                      Text(widget.artistName,maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24)),
                      
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: ListView.builder(
                              itemCount:
                                  Provider.of<Artist>(context, listen: false)
                                      .songs
                                      .length,
                              itemBuilder: (context, i) => SongTileItem(token: widget.token,
                                  song: Provider.of<Artist>(context,
                                          listen: false)
                                      .songs[i]))),
                    ],
                  );
        },
      )),
    );
  }
}
