import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task/models/artist.dart';
import 'package:task/providers/artist.dart';
import 'package:task/widgets/artist_list_item.dart';

class ArtistsScreen extends StatefulWidget {
  final String token;

  const ArtistsScreen({Key key, this.token}) : super(key: key);
  @override
  _ArtistsScreenState createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  Future _future;
  @override
  void initState() {
    super.initState();
    _future = Provider.of<ArtistsProvider>(context, listen: false)
        .fetchArtists(widget.token);
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
              List<Artist> artists =
                  Provider.of<ArtistsProvider>(context, listen: false).artists;
              return ListView.builder(
                      itemCount: artists.length,
                  itemBuilder: (context, i) => ArtistListItem(artist:artists[i]));
            }
          }),
    );
  }
}
