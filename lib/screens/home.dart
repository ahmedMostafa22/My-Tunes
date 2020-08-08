import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spotify/spotify.dart';
import 'package:task/tabs/overview.dart';

class Home extends StatefulWidget {
  final SpotifyApi spotify;

  const Home({Key key, this.spotify}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value) => widget.spotify
        .getCredentials()
        .then((value) => token = value.accessToken));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: GradientAppBar(
          bottom: PreferredSize(
            child: Container(
              height: height * 0.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 46,
                          color: Colors.white)),
                  SizedBox(height: height * 0.02),
                  TabBar(
                    indicatorColor: Colors.blue[600],
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(child: Text('OVERVIEW')),
                      Tab(child: Text('GENERS & MOODS')),
                      Tab(child: Text('PODCASTS')),
                      Tab(child: Text('PLAYLISTS')),
                      Tab(child: Text('ARTISTS')),
                      Tab(child: Text('ALBUMS')),
                      Tab(child: Text('PLAYING NOW')),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(height * 0.22),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[900], Colors.black]),
        ),
        body: TabBarView(children: <Widget>[
          Overview(token: token),
          Container(color: Colors.black),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.black,
          ),
          Container(color: Colors.black),
        ]),
      ),
    );
    ;
  }
}
