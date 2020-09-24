import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spotify/spotify.dart';
import 'package:task/tabs/albums.dart';
import 'package:task/tabs/artists.dart';
import 'package:task/tabs/geners.dart';
import 'package:task/tabs/overview.dart';
import 'package:task/tabs/playlists.dart';
import 'package:task/tabs/search.dart';

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
            length: 6,
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Scaffold(
                resizeToAvoidBottomPadding: true,
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
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  break;
                                case 1:
                                  setState(() => title = 'Search');
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  break;
                                case 2:
                                  setState(() => title = 'Playlists');
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  break;
                                case 3:
                                  setState(() => title = 'Artists');
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  break;
                                case 4:
                                  setState(() => title = 'Albums');
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  break;
                                case 5:
                                  setState(() => title = 'Genres & Moods');
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  break;
                              }
                            },
                            tabs: <Widget>[
                              Tab(child: Text('OVERVIEW')),
                              Tab(child: Text('SEARCH')),
                              Tab(child: Text('PLAYLISTS')),
                              Tab(child: Text('ARTISTS')),
                              Tab(child: Text('ALBUMS')),
                              Tab(child: Text('GENRES & MOODS')),
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
                backgroundColor: Colors.black,
                body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Overview(token: token),
                      SearchTab(token: token),
                      PlaylistsScreen(token: token),
                      ArtistsScreen(token: token),
                      AlbumsScreen(token: token),
                      Geners(token: token),
                    ]),
              ),
            ),
          );
      },
    );
  }
}
