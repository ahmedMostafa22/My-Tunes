import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spotify/spotify.dart';
import 'package:task/tabs/albums.dart';
import 'package:task/tabs/artists.dart';
import 'package:task/tabs/geners.dart';
import 'package:task/tabs/overview.dart';
import 'package:task/tabs/playlists.dart';

class Home extends StatefulWidget {
  final SpotifyApi spotify;
  const Home({Key key, this.spotify}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _future;
  String token;
  String title;
  @override
  void initState() {
    super.initState();
    title = 'Overview';
    _future = widget.spotify
        .getCredentials()
        .then((value) => token = value.accessToken);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData)
          return Container(
            color: Colors.black,
            child: Center(child: CircularProgressIndicator()),
          );
        else
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: GradientAppBar(
                bottom: PreferredSize(
                  child: Container(
                    height: height * 0.22,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                                color: Colors.white)),
                        SizedBox(height: height * 0.02),
                        TabBar(
                          indicatorColor: Colors.blue[600],
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          onTap: (ind) {
                            switch (ind) {
                              case 0:
                                setState(() => title = 'Overview');
                                break;
                              case 1:
                                setState(() => title = 'Genres & Moods');
                                break;
                              case 2:
                                setState(() => title = 'Playlists');
                                break;
                              case 3:
                                setState(() => title = 'Artists');
                                break;
                              case 4:
                                setState(() => title = 'Albums');
                                break;
                            }
                          },
                          tabs: <Widget>[
                            Tab(child: Text('OVERVIEW')),
                            Tab(child: Text('GENRES & MOODS')),
                            Tab(child: Text('PLAYLISTS')),
                            Tab(child: Text('ARTISTS')),
                            Tab(child: Text('ALBUMS')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(height * 0.2),
                ),
                elevation: 0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue[900], Colors.black]),
              ),
              body: TabBarView(physics: NeverScrollableScrollPhysics(),children: <Widget>[
                Overview(token: token),
                Geners(token: token),
                PlaylistsScreen(token: token),
                ArtistsScreen(token: token),
                AlbumsScreen(token: token),
              ]),
            ),
          );
      },
    );
  }
}
